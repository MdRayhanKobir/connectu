<?php

namespace App\Http\Controllers\User;

use Pusher\Pusher;
use App\Models\User;
use App\Models\Message;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Models\UserNotification;
use App\Http\Controllers\Controller;

class MessageController extends Controller
{
     public function fetchUser(){
        $pageTitle = 'All Users';
        $users = User::active()->where('id','!=',auth()->user()->id)->latest()->paginate(getPaginate());
        return view($this->activeTemplate.'user.message.index',compact('pageTitle','users'));
     }

     public function getChatbox ($id){
        $receiverUser = User::findOrFail($id);
        $pageTitle = $receiverUser->username;
        $messages = Message::with('sender')
            ->where(function ($query) use ($id) {
                $query->where('sender_id', auth()->id())
                    ->where('receiver_id', $id);
            })
            ->orWhere(function ($query) use ($id) {
                $query->where('sender_id', $id)
                    ->where('receiver_id', auth()->id());
            })
            ->orderBy('created_at', 'asc')
            ->get();

        return view($this->activeTemplate.'user.message.chat_box',compact('pageTitle','receiverUser','messages'));
     }

     public function sendMessage(Request $request)
    {

        $request->validate([
            "receiver_id" => "required|numeric",
            "message" => "required_if:attachment,null",
            'attachment' => ['nullable', 'file', new FileTypeValidate(['jpg', 'jpeg', 'png', 'gif'])]
        ]);

        $user  = auth()->user();
        $message =  new Message();
        $message->sender_id = $user->id;
        $message->receiver_id = $request->receiver_id;
        $message->message = $request->message;

        if ($request->hasFile('attachment')) {
            try {
                $filename = fileUploader($request->attachment, getFilePath('chatFiles'));
                $message->attachment = $filename;
            } catch (\Exception $exp) {
                $notify[]       = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }

        $message->save();


        $senderImagePath = getImage(getFilePath('userProfile') . '/' . ($user->image ?? ''), getFileSize('userProfile'));
        $sendTime = date('h:i a',strtotime($message->created_at));


        $options = [
            'cluster' => gs()->pusher_credential->app_cluster,
            'encrypted' => gs()->pusher_credential->useTLS
        ];

        $pusher = new Pusher(
            gs()->pusher_credential->app_key,
            gs()->pusher_credential->app_secret,
            gs()->pusher_credential->app_id,
            $options
        );

        $data = [
            'id' => $message->id,
            'attachment' => $message->attachment ? getImage(getFilePath('chatFiles').'/'.$message->attachment)
            : '',
            'message' => $message->message,
            'sender' => $message->sender_id,
            'receiver' =>  $message->receiver_id,
            'created_at' => $message->created_at,
            'senderImag' => $senderImagePath,
            'sendTime' => $sendTime,
        ];
        $event_name = '' . $message->receiver_id . '';
        $pusher->trigger($event_name, "App\\Events\\Chat", $data);
        return response()->json($data);
    }
}

<?php

namespace App\Http\Controllers\User;

use App\Models\Post;
use App\Models\Comment;
use App\Models\Hashtag;
use App\Models\PostMedia;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Models\UserNotification;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    public function store(Request $request){

        $request->validate([
            'image' => ['nullable','image','max:2048', new FileTypeValidate(['jpg', 'jpeg', 'png','gif'])],
            'video' => ['nullable','file','max:100000', new FileTypeValidate(['mp4', 'avi','mov'])],
            'file' => ['nullable','file','max:2048', new FileTypeValidate(['zip', 'rar','pdf'])],
            'audio' => ['nullable','file','max:2048', new FileTypeValidate(['mp3','mpeg'])],
        ]);

        preg_match_all('/#(\w+)/', $request->text, $matches);
        $hashtags = $matches[1];


        $post = new Post();
        $post->user_id = auth()->user()->id;
        $post->text = $request->text;
        $post->privacy = $request->privacy;
        $post->status = 1;
        $post->post_count += 1;
        $post->save();

        if(!$post->id){
            $notify[] = ['error', "An error occurred while creating the post"];
            return back()->withNotify($notify);
        }

        foreach (['image', 'video', 'audio', 'file'] as $type) {
            if ($request->hasFile($type)) {
                try {
                    $file = $request->file($type);

                    $filePath = fileUploader($file, getFilePath('PostMedia'));

                    $postImage = new PostMedia();
                    $postImage->post_id = $post->id;
                    $postImage->type = $type;
                    $postImage->file = $filePath;
                    $postImage->save();
                } catch (\Exception $exp) {
                    $notify[] = ['error', "Couldn't upload your $type"];
                    return back()->withNotify($notify);
                }
            }
        }

        foreach ($hashtags as $tag) {
            $tag = str_replace('#', '', $tag);
            $hashtag = Hashtag::firstOrCreate(['tag' => $tag]);
            $post->hashtags()->attach($hashtag->id);
            $hashtag->increment('post');
        }

        $notify[] = ['success', 'Post has been created successfully'];
        return back()->withNotify($notify);
    }


    // hashtag post
    public function fetchHashTagPosts(Request $request, $hashtag){
        $user = auth()->user();
        $hashtag = Hashtag::where('tag', $hashtag)->first();

        if (!$hashtag) {
            // Handle when the hashtag does not exist
            abort(404);

        }
        $pageTitle = 'Search By #'.$hashtag->tag;


        $posts = Post::with(['user', 'postFile','likedByUsers'])
        ->where('status', 1)
        ->where('privacy', 'everyone')
        ->whereHas('hashtags', function ($query) use ($hashtag) {
            $query->where('tag', $hashtag->tag);
        })
        ->latest()
        ->paginate(getPaginate());


        return view($this->activeTemplate . 'user.dashboard', compact('pageTitle','user','posts'));
    }


    public function details($id){
        $pageTitle='Details';
        $user = auth()->user();
        $post = Post::with(['user', 'postFile','likedByUsers'])
        ->where(function ($query) {
            $query->where('user_id', auth()->user()->id)
                  ->orWhereIn('user_id', function ($subQuery) {
                      $subQuery->select('following_id')
                          ->from('user_follows')
                          ->where('follower_id', auth()->user()->id);
                  });
        })
        ->where('status', 1)
        ->where('id',$id)
        ->where('privacy', 'everyone')->first();
        return view($this->activeTemplate.'user.post_details',compact('pageTitle','post'));
    }



    public function reply(Request $request, $parent_id = 0) {
        $request->validate([
            'reply' => 'required|string|max:255',
            'post_id' => 'required',
        ]);

        $comment = new Comment();
        $comment->user_id = auth()->user()->id;
        $comment->post_id = $request->post_id;
        $comment->reply = $request->reply;
        if ($request->parent_id) {
            $comment->parent_id = $request->parent_id;
        } else {
            $comment->parent_id = $parent_id;
        }
        $comment->save();

        $post = Post::find($request->post_id);
        $post->replys_count += 1;
        $post->save();

        if($comment->user_id != $post->user_id){

            $notification = new UserNotification();
            $notification->user_id = $post->user_id;
            $notification->from_user = $comment->user_id;
            $notification->title = 'Comments on your post';
            $notification->status = 0;
            $notification->click_url = urlPath('user.post.details',$post->id);
            $notification->save();
        }

        $notify[] = ['success', 'Replied Successfully'];
        return back()->withNotify($notify);

    }

    public function deleteReply(Request $request, $id) {
        $comment = Comment::find($id);
        if(auth()->user()->id == $comment->user_id){
            $childs = Comment::whereParentId($comment->id)->get();
            foreach($childs as $item){
                $item->delete();
            }
            $comment->delete();
            $post = Post::find($comment->post_id);
            if($post->replys_count > 0){
                $post->replys_count -= $childs->count() + 1;
                $post->save();
            }
            $notify[] = ['success', 'Deleted!'];
            return back()->withNotify($notify);
        }else{
            $notify[] = ['error', 'Failed!'];
            return back()->withNotify($notify);
        }

    }

    public function updateReply(Request $request){
        $comment = Comment::findOrFail($request->id);
        $comment->reply = $request->reply;
        $comment->save();
        $notify[] = ['success', 'Updated!'];
        return back()->withNotify($notify);

    }

    public function moveArchive($id){
        $post = Post::findOrFail($id);
        $post->delete();

        $notify[] = ['success','The post has been moved to the archive'];
        return redirect()->back()->withNotify($notify);

    }

}




<?php

namespace App\Http\Controllers\User;

use App\Models\Post;
use App\Models\Hashtag;
use App\Models\PostMedia;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    public function store(Request $request){

        // dd($request->video);
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


        $posts = $hashtag->posts()
        ->with(['user', 'postFile'])
        ->where('status', 1)
        ->where('privacy', 'everyone')
        ->latest()
        ->paginate(getPaginate());
        return view($this->activeTemplate . 'user.dashboard', compact('pageTitle','user','posts'));
    }

}




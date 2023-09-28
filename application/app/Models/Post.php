<?php

namespace App\Models;

use App\Models\Hashtag;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    use HasFactory,SoftDeletes;

    protected $dates = ['deleted_at'];

    public function hashtags()
    {
        return $this->belongsToMany(Hashtag::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function postFile()
    {
        return $this->hasMany(PostMedia::class);
    }

    public function likedByUsers() {
        return $this->belongsToMany(User::class, 'like_user', 'post_id', 'user_id');
    }


    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

}

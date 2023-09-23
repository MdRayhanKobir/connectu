<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

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

}

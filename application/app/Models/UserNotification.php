<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model
{
    use HasFactory;

    public function fromUser()
    {
        return $this->belongsTo(User::class, 'from_user');
    }

    public function post(){
        return $this->belongsTo(Post::class);
    }
}

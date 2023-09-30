<?php

namespace App\Http\Controllers\User;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MessageController extends Controller
{
     public function fetchUser(){
        $pageTitle = 'All Users';
        $users = User::active()->where('id','!=',auth()->user()->id)->latest()->paginate(getPaginate());
        return view($this->activeTemplate.'user.message.index',compact('pageTitle','users'));
     }
}

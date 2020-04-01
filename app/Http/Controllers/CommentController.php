<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;
use App\Comment;

class CommentController extends Controller
{
    public function store(Request $request,$post){
        $comment = new Comment();
        $comment->user_id = Auth::id();
        $comment->post_id = $post;
        $comment->comment = $request->comment;
        $comment->save();
        Toastr::success('Comment successfully published.' ,'Success');
        return redirect()->back();
    }
}

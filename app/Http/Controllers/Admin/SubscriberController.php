<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Subscriber;
use Brian2694\Toastr\Facades\Toastr;

class SubscriberController extends Controller
{
    public function index()
    {
        $subscribers = Subscriber::latest()->get();
        return view('admin.subscriber',compact('subscribers'));

    }

    public function destroy($id)
    {
        $subscriber = Subscriber::find($id);
        $subscriber->delete();
        Toastr::success('Subscriber successfully deleted.','Success');
        return redirect()->back();
    }
}

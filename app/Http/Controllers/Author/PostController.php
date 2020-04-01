<?php

namespace App\Http\Controllers\Author;

use App\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Category;
use App\Tag;
use Carbon\Carbon;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Auth::User()->posts()->latest()->get();
        return view('author.post.index',compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('author.post.create',compact('categories','tags'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'title' => 'required',
            'body' => 'required',
            'image' => 'required|image|mimes:jpeg,bmp,png,jpg',
            'categories' => 'required',
            'tags' => 'required',
        ]);

             // get form image
             $image = $request->file('image');
             $slug = str_slug($request->title);
             if (isset($image))
             {
     //            make unique name for image
                 $currentDate = Carbon::now()->toDateString();
                 $imagename = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
     //            check post dir is exists
                 if (!Storage::disk('public')->exists('post'))
                 {
                     Storage::disk('public')->makeDirectory('post');
                 }
     //            resize image for post and upload
                 $postimage = Image::make($image)->resize(1600,479)->save($image->getClientOriginalExtension());
                 Storage::disk('public')->put('post/'.$imagename,$postimage);
     
             } else {
                 $imagename = "default.png";
             }

             $post = new Post();
             $post->user_id = Auth::user()->id;
             $post->title = $request->title;
             $post->slug = $slug;
             $post->image = $imagename;
             $post->body = $request->body;
             if(isset($request->status))
        {
            $post->status = true;
        }else {
            $post->status = false;
        }
            $post->is_approved = false;
             $post->save();

             $post->categories()->attach($request->categories);
             $post->tags()->attach($request->tags);

             Toastr::success('Post successfully saved' ,'Success');
             return redirect()->route('author.post.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        if($post->user_id != Auth::id())
        {
            Toastr::error('You are not authorized to access this post!' ,'Error');
            return redirect()->back();
        }
        return view('author.post.show',compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $post = Post::find($id);
        if($post->user_id != Auth::id())
        {
            Toastr::error('You are not authorized to access this post!' ,'Error');
            return redirect()->back();
        }
        $categories = Category::all();
        $tags = Tag::all();
        $post = Post::find($id);
        return view('author.post.edit',compact('post','categories','tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $post = Post::find($id);
        if($post->user_id != Auth::id())
        {
            Toastr::error('You are not authorized to access this post!' ,'Error');
            return redirect()->back();
        }

        $this->validate($request,[
            'title' => 'required',
            'body' => 'required',
            'image' => 'mimes:jpeg,bmp,png,jpg',
            'categories' => 'required',
            'tags' => 'required',
        ]);
             // get form image
             $image = $request->file('image');
             $slug = str_slug($request->title);
             $post = Post::find($id);
     
             if (isset($image))
             {
     //            make unique name for image
                 $currentDate = Carbon::now()->toDateString();
                 $imagename = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
     //            check post dir is exists
                 if (!Storage::disk('public')->exists('post'))
                 {
                     Storage::disk('public')->makeDirectory('post');
                 }
    //            delete old image
            if (Storage::disk('public')->exists('post/'.$post->image))
            {
                Storage::disk('public')->delete('post/'.$post->image);
            }
     //            resize image for post and upload
                 $postimage = Image::make($image)->resize(1600,479)->save($image->getClientOriginalExtension());
                 Storage::disk('public')->put('post/'.$imagename,$postimage);     
             }
             else {
                $imagename = $post->image;
            }

             $post->user_id = Auth::user()->id;
             $post->title = $request->title;
             $post->slug = $slug;
             $post->image = $imagename;
             $post->body = $request->body;
             if(isset($request->status))
             {
                 $post->status = true;
             }else {
                 $post->status = false;
             }
            $post->is_approved = false;
             $post->save();

             $post->categories()->sync($request->categories);
             $post->tags()->sync($request->tags);

             Toastr::success('Post successfully updated' ,'Success');
             return redirect()->route('author.post.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);
        if($post->user_id != Auth::id())
        {
            Toastr::error('You are not authorized to access this post!' ,'Error');
            return redirect()->back();
        }

        $post = Post::find($id);

        if (Storage::disk('public')->exists('post/'.$post->image))
        {
            Storage::disk('public')->delete('post/'.$post->image);
        }

        $post->categories()->detach();
        $post->tags()->detach();
        $post->delete();
        Toastr::success('Post successfully deleted.','Success');
        return redirect()->route('author.post.index');
    }
}

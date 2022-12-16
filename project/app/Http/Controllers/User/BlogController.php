<?php

namespace App\Http\Controllers\User;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\BlogRequest;
use App\Http\Resources\BlogResource;
use App\Models\Blog;
use App\Models\BlogCategory; 

class BlogController extends Controller
{

   public function __construct(BlogResource $resource)
   {
       $this->resource = $resource;
   }


    public function index()
    {
        $blogs = Blog::with('category')->where('type', 'user')->where('user_id', auth()->user()->id)->latest()->paginate(15);
        return view('user.blog.index',compact('blogs'));
    }

  
    public function create()
    {
        $categories = BlogCategory::where('status',1)->get(); 
        return view('user.blog.create',compact('categories'));
    }

   
    public function store(BlogRequest $request)
    {        
        $request->merge(['status' => 2]); 
        $request->merge(['type' => 'user']);    
        $request->merge(['user_id' => auth()->user()->id]);
        $input = $request->only('title','category_id','description','photo','status', 'type', 'user_id');        
        $this->resource->store($input);
        return back()->with('success','New blog has been created, and is in under review');
    }

  
    public function edit(Blog $blog)
    {
        $categories = BlogCategory::where('status',1)->get(); 
        return view('user.blog.edit',compact('blog','categories'));
    }
    
    public function update(BlogRequest $request, Blog $blog)
    {
        $request->merge(['status' => 2]);            
        $this->resource->update($request->only('title','category_id','description','photo','status'),$blog);
        return back()->with('success','Blog has been updated, and is in under review');
    }

    public function destroy(Blog $blog)
    {
        $blog->delete();
        return back()->with('success','Blog has been deleted');
    }
}

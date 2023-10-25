<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BlogCategory;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class BlogCategoryController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:blog-category-list', ['only' => ['index']]);
        $this->middleware('permission:blog-category-create', ['only' => ['store']]);
        $this->middleware('permission:blog-category-edit', ['only' => ['update']]);
        $this->middleware('permission:blog-category-delete', ['only' => ['delete']]);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if(Auth::check() && Auth::user()->usertype == 'admin') {
            $categories = BlogCategory::orderBy('id', 'desc')->get();
        }else{
            $categories = BlogCategory::where('user_id', Auth::id())->orderBy('id', 'desc')->get();
        }
        return view("backend.blog.category.index", compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(
            [
                'title'=>'required',
                'description'=>'nullable',
            ],
            [
                'title.required'=>'Blog Categry Title is Required',
            ]
        );

        $blog_category = new BlogCategory();
        $blog_category->title = $request->title;
        $blog_category->slug = Str::slug($request->title);
        $blog_category->description = $request->description;
        $blog_category->status = $request->status;
        $blog_category->image = $request->image ? $request->image : 'default.png'; 
        $blog_category->svg = $request->svg;
        $blog_category->meta_title = $request->meta_title;
        $blog_category->meta_description = $request->meta_description;
        $blog_category->meta_keywords = $request->meta_keywords;
        $blog_category->user_id = Auth::id();
        $blog_category->save();

        session()->flash('success', 'Blog Category has been created !!');

        return response()->json([
            'status'=>'success',
            'message'=>'Blog Category has been created !!',
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate(
            [
                'title'=>'required',
                'description'=>'nullable',
            ],
            [
                'title.required'=>'Blog Category Title is Required',
            ]
        );

        $blog_category = BlogCategory::find($request->id);
        $blog_category->title = $request->title;
        $blog_category->slug = Str::slug($request->title);
        $blog_category->description = $request->description;
        $blog_category->status = $request->status;
        $blog_category->image = $request->image ? $request->image : 'default.png';
        $blog_category->svg = $request->svg;
        $blog_category->meta_title = $request->meta_title;
        $blog_category->meta_description = $request->meta_description;
        $blog_category->meta_keywords = $request->meta_keywords;
        $blog_category->user_id = Auth::id();
        $blog_category->save();

        session()->flash('success', 'Blog Category has been updated !!');

        return response()->json([
            'status'=>'success',
            'message'=>'Blog Category has been updated !!',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete(Request $request)
    {
        BlogCategory::find($request->id)->delete();

        return response()->json([
            'status'=>'success',
            'message'=>'Blog Category has been deleted !!',
        ]);
    }
}

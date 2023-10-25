<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{

    public function __construct()
    {
        $this->middleware('permission:user-list', ['only' => ['index']]);
        $this->middleware('permission:user-create', ['only' => ['store']]);
        $this->middleware('permission:user-delete', ['only' => ['delete']]);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::orderBy('id', 'desc')->get();
        return view("backend.user.user.index", compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view("backend.user.user.create");
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'first_name' => 'required|max:50',
            'last_name' => 'required|max:50',
            'email' => 'required|unique:users|max:50',
            'password' => 'required|min:6|max:50',
            'usertype' => 'required',
            'image' => 'nullable|image|mimes:jpg,png,jpeg|max:2048',
        ]);
        
        $user = new User();
        $user_exist = $user->where('email', $request->email)->first();
        if($user_exist){
            return redirect()->back()->with('error', 'Email already exist!');
        }

        $roles = request('roles');

        $user->first_name = $request->first_name;
        $user->last_name  = $request->last_name;
        $user->email      = $request->email;
        $user->password   = Hash::make($request->password);
        $user->usertype   = $request->usertype;
        $user->phone      = $request->phone;
        $user->country    = $request->country;
        $user->address    = $request->address;
        $user->city       = $request->city;
        $user->postal_code= $request->postal_code;
        $user->status     = $request->status ? $request->status : 'active';
        $user->facebook   = $request->facebook;
        $user->twitter    = $request->twitter;
        $user->linkedin   = $request->linkedin;
        $user->youtube    = $request->youtube;
        $user->vimeo      = $request->vimeo;
        $user->instagram  = $request->instagram;
        $user->website    = $request->website;
        $user->bio        = $request->bio;
        $user->designation= $request->designation;
        $user->experience = $request->experience;
        if($request->hasFile('image')){
            $image = $request->file('image');
            $image_name = "/uploads/users/" . time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/users');
            $image->move($destinationPath, $image_name);
            $user->image = $image_name;
        }else{
            $user->image = '/uploads/users/default.png';
        }

        if($request->usertype == 'admin'){
            if($roles){
                $user->assignRole($roles);
            }else{
                $user->assignRole('user');
            }
        }elseif($request->usertype == 'instructor'){
            $user->assignRole('instructor');
        }
        $user->save();
        session()->flash('success', 'User created successfully!');
        return redirect()->route('user.index')->with('success', 'User created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $user = User::findOrFail($id);
        $roles = Role::all();
        return view("backend.user.user.edit", compact(['user','roles']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //user update with image unlink old image
        $user = User::findOrFail($id);
        $request->validate([
            'first_name' => 'required|max:50',
            'last_name' => 'required|max:50',
            'email' => 'required|max:50|unique:users,email,'.$user->id,
            'password' => 'nullable|min:6|max:50',
            'image' => 'nullable|image|mimes:jpg,png,jpeg|max:2048',
        ]);

        $roles = request('roles');

        $user->first_name = $request->first_name;
        $user->last_name  = $request->last_name;
        $user->email      = $request->email;
        if($request->password){
            $user->password   = Hash::make($request->password);
        }
        $user->usertype   = $request->usertype ?? 'user';
        if($request->usertype == 'admin'){
            if($roles){
                $user->syncRoles($roles);
            }else{
                $user->assignRole('user');
            }
        }
        $user->phone      = $request->phone;
        $user->country    = $request->country;
        $user->address    = $request->address;
        $user->city       = $request->city;
        $user->postal_code= $request->postal_code;
        $user->status     = $request->status ? $request->status : 'active';
        $user->facebook   = $request->facebook;
        $user->twitter    = $request->twitter;
        $user->linkedin   = $request->linkedin;
        $user->youtube    = $request->youtube;
        $user->vimeo      = $request->vimeo;
        $user->instagram  = $request->instagram;
        $user->website    = $request->website;
        $user->bio        = $request->bio;
        $user->designation= $request->designation;
        $user->experience = $request->experience;
        if ($request->hasFile('image')) {
            if ($user->image && file_exists(public_path($user->image))) {
                unlink(public_path($user->image));
            }
            $image = $request->file('image');
            $image_name = "/uploads/users/" . time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/users');
            $image->move($destinationPath, $image_name);
            $user->image = $image_name;
        }

        $user->save();
        return redirect()->back()->with('success', 'User updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //delete user with image
        $user = User::findOrFail($id);
        if($user->image){
            unlink($user->image);
        }
        $user->delete();
        return redirect()->route('user.index')->with('success', 'User deleted successfully!');
    }
}

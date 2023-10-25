<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Cart;
use App\Models\Coupon;
use App\Models\Course;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function cart() {
        
        if(!Auth::check()) {
            return redirect()->route('login')->with('error','Please login first');
        }

        $cart = Cart::with("course")->where('user_id',auth()->user()->id)->get();
        $cartTotal = Cart::where('user_id',auth()->user()->id)->sum('total');
        return view('frontend.pages.cart',compact(['cart','cartTotal']));
    }
    public function addToCart($slug) {
        // cart add on database 
        $course = Course::where('slug',$slug)->first();
        $cart = Cart::where('course_id',$course->id)->where('user_id',auth()->user()->id)->first();
        if($cart) {
            $cart->increment('quantity');
            $cart->update([
                'total' =>  $cart->quantity * $cart->price,
            ]);
            return redirect()->route("cart")->with('success','Quantity updated successfully');
        }else{
            Cart::create([
                'course_id' => $course->id,
                'user_id' => auth()->user()->id,
                'price' => $course->discount_price ? $course->discount_price : $course->price,
                'total' => $course->discount_price ? $course->discount_price : $course->price,
                'quantity' => 1,
            ]);
            return redirect()->route("cart")->with('success','Course added to cart successfully');
        }
    }

    public function cartClear() {
        session()->forget('coupon');
        $carts = Cart::where('user_id',auth()->user()->id)->get();
        foreach($carts as $cart) {
            $cart->delete();
        }

        return redirect()->back()->with('success','Cart cleared successfully');
    }

    public function cartRemove($id) {
        $cart = Cart::where('course_id',$id)->where('user_id',auth()->user()->id)->first();
        $cart->delete();
        return redirect()->back()->with('success','Cart Item deleted successfully');
    }

    public function cartIncrement($id) {
        $cart = Cart::where('course_id',$id)->where('user_id',auth()->user()->id)->first();
        $cart->increment('quantity');
        $cart->update([
            'total' => $cart->quantity * $cart->price,
        ]);
        return redirect()->back()->with('success','Quantity updated successfully');
    }

    public function cartDecrement($id) {
        $cart = Cart::where('course_id',$id)->where('user_id',auth()->user()->id)->first();
        if($cart->quantity == 0) {
            $cart->delete();
            return redirect()->back()->with('success','Quantity updated successfully');
        }
        $cart->decrement('quantity');
        $cart->update([
            'total' => $cart->quantity * $cart->price,
        ]);
        return redirect()->back()->with('success','Quantity updated successfully');
    }

    public function coupon(Request $request) {
        $price = $request->subtotal;
        $price = str_replace("৳","",$price);
        $price = str_replace("€","",$price);
        $price = str_replace("₹","",$price);
        $price = str_replace("$","",$price);
        $price = str_replace(",","",$price);
        $subtotal = floatval($price);
        $total = $subtotal;
        try {
            $coupon = Coupon::where('code', $request->coupon_code)->where('status',"active")->first();
            if(!$coupon){
                return response()->json(['error' => 'Coupon not found'], 400);
            }
            if($coupon->expired_at < date('Y-m-d')){
                return response()->json(['error' => 'Coupon expired'], 400);
            }

            if($coupon->count == "unlimited"){
                if($coupon->type == 'fixed') {
                    $total = $subtotal - $coupon->ammount;
                }elseif($coupon->type == 'percentage'){
                    $total = $subtotal - ($subtotal * $coupon->ammount / 100);
                }
                session()->put('coupon',[
                    'name' => $coupon->code,
                    'discount' => $coupon->ammount,
                    'type' => $coupon->type,
                    'total' => $total,
                ]);
                return response()->json([
                    'success' => 'Coupon applied successfully',
                    'total' => $total,
                ],200);
            }elseif($coupon->count < 1){
                return response()->json(['error' => 'Coupon limit expired'], 400);
            }else{
                $coupon->decrement('count');
                if($coupon->type == 'fixed') {
                    $total = $subtotal - $coupon->ammount;
                }elseif($coupon->type == 'percentage'){
                    $total = $subtotal - ($subtotal * $coupon->ammount / 100);
                }
            }
            session()->put('coupon',[
                'name' => $coupon->code,
                'discount' => $coupon->ammount,
                'type' => $coupon->type,
                'total' => $total,
            ]);
            return response()->json([
                'total' => $total,
                'success' => 'Coupon applied successfully',
            ],200);
        } catch (\Throwable $th) {
            return response()->json([
                'total' => $subtotal,
                'coupon' => null,
                'error' => 'Something went wrong',
            ]);
        }
        
    }
 
}

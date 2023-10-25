<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Course;
use Illuminate\Validation\ValidationException;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use App\Models\Order;
use Razorpay\Api\Api;

class CheckoutController extends Controller
{
    // checkout page
    public function index()
    {
        $cart = Cart::with("course")->where('user_id', auth()->user()->id)->get();
        $cartTotal = Cart::where('user_id', auth()->user()->id)->sum('total');
        return view("frontend.pages.checkout", compact(['cart', 'cartTotal']));
    }

    // checkout data store
    public function store(Request $request)
    {
        try {
            $request->validate([
                'first_name' => 'required',
                'last_name' => 'required',
                'address' => 'required',
                'country' => 'required',
                'phone' => 'required',
                'email' => 'required',
                'paymentMethod' => 'required',
            ]);
        } catch (ValidationException $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }

        //if payment method is stripe then redirect to stripe payment page and if is success then store data to database and redirect to success page
        if ($request->paymentMethod == "stripe") {
            // Set your Stripe secret key
            Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
            $total = session()->get('totalAmount');
            $sessioncode =strtolower(session()->get("currency_info")['code']);
            $exchange_rate = session()->get("currency_info")['exchange_rate'];
            $total = $total * $exchange_rate;
            // Create a new Checkout Session    
            $session = Session::create([
                'payment_method_types' => ['card'],
                'line_items' => [
                    [
                        'price_data' => [
                            'currency' => $sessioncode ?? 'usd',
                            'unit_amount' => $total * 100, // Amount in cents
                            'product_data' => [
                                'name' => 'Course Purchase',
                            ],
                        ],
                        'quantity' => 1,
                    ],
                ],
                'mode' => 'payment',
                'success_url' => route('checkout.success'), // URL to redirect on successful payment
                'cancel_url' => route('checkout.cancel'),   // URL to redirect if payment is canceled
            ]);
            if ($session->id) {
                //store data to database
                $order = new Order();
                $order->order_number = uniqid();
                $order->user_id = auth()->user()->id;
                $order->status = "pending";
                $order->payment_status = "pending";
                $order->payment_method = $request->paymentMethod;
                $order->payment_id = $session->id;
                $order->total = $total;
                $order->quantity = $request->quantity;
                $order->save();

                //store order item
                $cart = Cart::where('user_id', auth()->user()->id)->get();
                foreach ($cart as $item) {
                    $order->orderItems()->create([
                        'course_id' => $item->course_id,
                        'order_id' => $order->id,
                        'price' => $item->price,
                        'quantity' => $item->quantity,
                        'total' => $item->total,
                        'user_id' => auth()->user()->id,
                    ]);
                    $instructor_id = Course::where('id', $item->course_id)->first()->user_id;
                    \App\Models\UserCourse::create([
                        'user_id' => $instructor_id,
                        'course_id' => $item->course_id,
                    ]);
                }   
                //redirect to stripe payment page
                return redirect($session->url);
            } else {
                return redirect()->back()->with('error', 'Something went wrong');
            }
            return redirect($session->url);
        } else {
            return "Something went wrong";
        }
    }

    public function handleRazorpayPaymentProcess($request)
    {
        $total = session()->get('totalAmount');
        $api = new Api(env("RAZORPAY_KEY_ID"), env("RAZORPAY_KEY_SECRET"));

        $order = $api->order->create([
            'receipt' => rand(),
            'amount' => $total * 100,
            'currency' => 'BDT',
        ]);
        $order_id = rand(100000, 999999);

        return redirect()->route('checkout.success');
    }

    // checkout success page
    public function success()
    {
        
        // delete cart data
        Cart::where('user_id', auth()->user()->id)->delete();
        session()->flash('success', 'Order placed successfully');
        session()->forget('totalAmount');
        session()->forget('coupon');
        $order = Order::with("user")->where('user_id', auth()->user()->id)->latest()->first();
        $orderItems = $order->orderItems()->get();
        return view("frontend.pages.checkout-success", compact(['order', 'orderItems']))->with('success', 'Order placed successfully');
    }

    // checkout cancel page
    public function cancel()
    {
        session()->flash('error', 'Order canceled');
        return view("frontend.pages.checkout-cancel");
    }



    public function pdf()
    {
        return view('frontend.pages.pdf');
    }
}

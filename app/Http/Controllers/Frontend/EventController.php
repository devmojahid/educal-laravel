<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Event;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use App\Models\TicketOrder;

class EventController extends Controller
{
    //event details page
    public function eventDetails($id)
    {
        $event = Event::where('id', $id)->first();
        return view("frontend.pages.event-details", compact('event'));
    }

    //eventTicket buy with stripe payment
    public function eventTicket(Request $request)
    {
        $event = Event::where('id', $request->event_id)->first();
        $user = auth()->user();
        $price = $event->ticket_price;
        if($event->ticket_discount_price){
            $price = $event->ticket_discount_price;
        }else{
            $price = $event->ticket_price;
        }

        // Set your Stripe secret key
        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [
                [
                    'price_data' => [
                        'currency' => 'usd',
                        'unit_amount' => $price * 100, // Amount in cents
                        'product_data' => [
                            'name' => 'Event Ticket',
                        ],
                    ],
                    'quantity' => 1,
                ],
            ],
            'mode' => 'payment',
            'success_url' => route('event.ticket.success', ['event_id' => $event->id, 'user_id' => $user->id]),
            'cancel_url' => route('checkout.cancel'),
        ]);

        if($session->id){
            $order = new TicketOrder();
            $order->order_number = uniqid('TICKET');
            $order->user_id = $user->id;
            $order->event_id = $event->id;
            $order->status = "pending";
            $order->total = $event->price;
            $order->save();
        }

        return redirect($session->url);
    }

    //event ticket success
    public function eventTicketSuccess(Request $request)
    {
        $event = Event::where('id', $request->event_id)->first();
        $user = auth()->user();
        $order = TicketOrder::where('user_id', $user->id)->where('event_id', $event->id)->first();
        return view('frontend.pages.event-ticket-success', compact(['event', 'user', 'order']));
    }
}

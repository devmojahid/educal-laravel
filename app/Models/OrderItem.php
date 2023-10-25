<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $guarded = [];

    // relationship with order
    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    // relationship with course
    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    // relationship with user order table
    public function userOrder()
    {
        return $this->belongsTo(UserOrder::class);
    }

    // relationship with user
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    


}

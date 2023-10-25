<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function course() {
        return $this->belongsTo(Course::class);
    }

    public function getCountAttribute() {
        return Cart::where('user_id',auth()->user()->id)->count();
    }
}

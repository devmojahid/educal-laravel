<?php

namespace App\Http\Controllers\Backend\Pages\About;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SystemSetting;

class CounterController extends Controller
{
    public function index()
    {
        $counterData = SystemSetting::where('key', 'about_counter')->first();
        if(isset($counterData->value)){
            $counters = json_decode($counterData->value,true);
        }else{
            $counters = [
                'title' => '',
                'description' => '',
                'counter_icon' => [],
                'counter_amount' => [],
                'counter_desc' => [],
            ];
        }
        
        return view('backend.pages.about.counter.index', compact('counters'));
    }

    public function update(Request $request) {
        $counter = SystemSetting::where('key', 'about_counter')->first();
        if(!$counter){
            $data = [
                'title' => $request->title,
                'description' => $request->description,
                
            ];
            $data['counter']['counter_icon'] = $request->counter_icon;
            $data['counter']['counter_amount'] = $request->counter_amount;
            $data['counter']['counter_desc'] = $request->counter_desc;
            SystemSetting::create([
                'key' => 'about_counter',
                'value' => json_encode($data)
            ]);
            return redirect()->back()->with('success', 'Counter updated successfully');
        }else{
            $counterData = json_decode($counter->value, true);
            $counterData['title'] = $request->title;
            $counterData['description'] = $request->description;
            $counterData['counter']['counter_icon'] = $request->counter_icon;
            $counterData['counter']['counter_amount'] = $request->counter_amount;
            $counterData['counter']['counter_desc'] = $request->counter_desc;
            $counter->value = json_encode($counterData);
            $counter->save();
            return redirect()->back()->with('success', 'Counter updated successfully');

        }
    }
}

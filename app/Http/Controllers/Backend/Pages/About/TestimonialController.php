<?php

namespace App\Http\Controllers\Backend\Pages\About;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SystemSetting;

class TestimonialController extends Controller
{
    public function getBanner() {
        $testimonial = [];
        if(SystemSetting::where('key', 'testimonial')->exists()) {
            $testimonialData = SystemSetting::where('key', 'testimonial')->first();
            $testimonial = json_decode($testimonialData->value, true);
        }
        return $testimonial;
    }
    public function index() {
        $testimonial = [];
        if($this->getBanner()){
            $testimonial = $this->getBanner();
        }
        return view('backend.pages.about.testimonial.index', compact('testimonial'));
    }

    public function store(Request $request) {
       $testimonial = SystemSetting::where('key', 'testimonial')->first();
         if(!$testimonial){
            $data = [
            'title' => $request->title,
            'videoTitle'=> $request->videoTitle,
            'videoUrl'=> $request->videoUrl,
            'videoDesc'=> $request->videoDesc,
            'testimonial' => [
                    'info' => $request->info,
                    'clientName' => $request->clientName,
                    'clientdesignation' => $request->clientdesignation,
                ]
            ];

            // sideImage upload
            if($request->hasFile('sideImage')){
                $image_file = $request->file('sideImage');
                $image = '/uploads/testimonial/' . time() .'.' . $image_file->getClientOriginalExtension();
                $destinationPath = public_path('/uploads/testimonial');
                $image_file->move($destinationPath, $image);
                $data['testimonial']['sideImage'] = $image;
            }

            SystemSetting::create([
                'key' => 'testimonial',
                'value' => json_encode($data)
            ]);
            return redirect()->back()->with('success', 'Testimonial updated successfully');
        }else{
            // $image->extension()
            $testimonialData = json_decode($testimonial->value, true);
            $testimonialData['title'] = $request->title;
            $testimonialData['videoTitle'] = $request->videoTitle;
            $testimonialData['videoUrl'] = $request->videoUrl;
            $testimonialData['videoDesc'] = $request->videoDesc;
            $testimonialData['testimonial']['info'] = $request->info;
            $testimonialData['testimonial']['clientName'] = $request->clientName;
            $testimonialData['testimonial']['clientdesignation'] = $request->clientdesignation;
            // sideImage upload
            if($request->hasFile('sideImage')){
                $image_file = $request->file('sideImage')[0];
                $image = '/uploads/testimonial/' . time() .'.' . $image_file->getClientOriginalExtension();
                $destinationPath = public_path('/uploads/testimonial');
                $image_file->move($destinationPath, $image);
                $testimonialData['testimonial']['sideImage'] = $image;
               
            }
            
            $testimonial->value = json_encode($testimonialData);
            $testimonial->save();
            return redirect()->back()->with('success', 'Testimonial updated successfully');
        }

    }
}

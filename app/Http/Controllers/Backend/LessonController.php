<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Lesson;
use Illuminate\Support\Str;

class LessonController extends Controller
{
    public function storeLesson() {
        if(request()->ajax()) {
            if(request()->is_update == "true"){
              return  $this->updateLesson(request());
            }
            try {
                $slug = Str::slug(request()->title);
                $lessonSlug = Lesson::where('slug', $slug)->first();
                if($lessonSlug) {
                    $slug = $slug . '-' . time();
                }

                $image_name = null;
                if (request()->hasFile('video_thumbnail')) {
                    $image = request()->file('video_thumbnail');
                    $image_name =  '/uploads/courses/lessons/'. time() . '.' . $image->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $image->move($destinationPath, $image_name);
                }

                $video_file_name = null;
                if (request()->hasFile('video_file')) {
                    $video_file = request()->file('video_file');
                    $video_file_name =  '/uploads/courses/lessons/'. time() . '.' . $video_file->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $video_file->move($destinationPath, $video_file_name);
                }

                $audio_file_name = null;
                if (request()->hasFile('audio_file')) {
                    $audio_file = request()->file('audio_file');
                    $audio_file_name =  '/uploads/courses/lessons/'. time() . '.' . $audio_file->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $audio_file->move($destinationPath, $audio_file_name);
                }

                $ppt_file_name = null;
                if (request()->hasFile('ppt_file')) {
                    $ppt_file = request()->file('ppt_file');
                    $ppt_file_name =  '/uploads/courses/lessons/'. time() . '.' . $ppt_file->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $ppt_file->move($destinationPath, $ppt_file_name);
                }

                $pdf_file_name = null;
                if (request()->hasFile('pdf_file')) {
                    $pdf_file = request()->file('pdf_file');
                    $pdf_file_name =  '/uploads/courses/lessons/'. time() . '.' . $pdf_file->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $pdf_file->move($destinationPath, $pdf_file_name);
                }

                $type = null;
                if(request()->video_file) {
                    $type = "video";
                }elseif(request()->video_url) {
                    $type = "url";
                }elseif(request()->audio_file) {
                    $type = "audio";
                }elseif(request()->ppt_file) {
                    $type = "ppt";
                }elseif(request()->pdf_file) {
                    $type = "pdf";
                }

                
                $lesson = Lesson::create([
                    'title' => request()->title,
                    'slug' => $slug,
                    'description' => request()->description,
                    'duration' => request()->duration,
                    'topic_id' => request()->topic_id,
                    'course_id' => request()->course_id,
                    'visibility' => request()->visibility,
                    'type' => $type,
                    'video_thumbnail' => $image_name,
                    'video' => $video_file_name,
                    'video_url' => request()->video_url,
                    'audio' => $audio_file_name,
                    'ppt' => $ppt_file_name,
                    'pdf' => $pdf_file_name,
                ]);

                return response()->json([
                    'message' => 'Lesson created successfully',
                    'lesson' => $lesson
                ]);

            } catch (\Throwable $th) {
                return response()->json([
                    'message' => 'Something went wrong',
                    'error' => $th->getMessage(),
                ]);
            }

        }
    }

    public function editLesson() {
        if(request()->ajax()) {
            try {
                $id = request()->id;
                $lesson = Lesson::find($id);
                return response()->json([
                    'lesson' => $lesson
                ]);
            } catch (\Throwable $th) {
                return response()->json([
                    'message' => 'Something went wrong',
                    'error' => $th->getMessage()
                ]);
            }
        }
    }

    public function updateLesson($request) {
        if(request()->ajax()) {
            try {
                $id = request()->lesson_id;
                $lesson = Lesson::find($id);
                $slug = Str::slug(request()->title);
                $lessonSlug = Lesson::where('slug', $slug)->first();
                if($lessonSlug) {
                    $slug = $slug . '-' . time();
                }

                $image_name = null;
                if (request()->hasFile('video_thumbnail')) {
                    //unlink  old image
                    if($lesson->video_thumbnail) {
                        unlink(public_path($lesson->video_thumbnail));
                    }
                    $image = request()->file('video_thumbnail');
                    $image_name =  '/uploads/courses/lessons/'. time() . '.' . $image->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $image->move($destinationPath, $image_name);
                }

                $video_file_name = null;
                if (request()->hasFile('video_file')) {
                    //unlink  old image
                    if($lesson->video) {
                        unlink(public_path($lesson->video));
                    }
                    $video_file = request()->file('video_file');
                    $video_file_name =  '/uploads/courses/lessons/'. time() . '.' . $video_file->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $video_file->move($destinationPath, $video_file_name);
                }

                $audio_file_name = null;
                if (request()->hasFile('audio_file')) {
                    if($lesson->audio) {
                        unlink(public_path($lesson->audio));
                    }
                    $audio_file = request()->file('audio_file');
                    $audio_file_name =  '/uploads/courses/lessons/'. time() . '.' . $audio_file->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $audio_file->move($destinationPath, $audio_file_name);
                }

                $ppt_file_name = null;
                if (request()->hasFile('ppt_file')) {
                    if($lesson->ppt) {
                        unlink(public_path($lesson->ppt));
                    }
                    $ppt_file = request()->file('ppt_file');
                    $ppt_file_name =  '/uploads/courses/lessons/'. time() . '.' . $ppt_file->getClientOriginalExtension();
                    $destinationPath = public_path('/uploads/courses/lessons');
                    $ppt_file->move($destinationPath, $ppt_file_name);
                }

                $pdf_file_name = null;
                if (request()->hasFile('pdf_file')) {
                    if($lesson->pdf) {
                        unlink(public_path($lesson->pdf));
                    }
                    $pdf_file = request()->file('pdf_file');
                    $pdf_file_name =  '/uploads/courses/lessons/'. time() . '.' . $pdf_file->getClientOriginalExtension();
                    $destinationPath = public_path
                    ('/uploads/courses/lessons');
                    $pdf_file->move($destinationPath, $pdf_file_name);
                }

                $type = null;
                if(request()->video_file) {
                    $type = "video";
                }elseif(request()->video_url) {
                    $type = "url";
                }elseif(request()->audio_file) {
                    $type = "audio";
                }elseif(request()->ppt_file) {
                    $type = "ppt";
                }elseif(request()->pdf_file) {
                    $type = "pdf";
                }

                $lesson->update([
                    'title' => request()->title,
                    'slug' => $slug,
                    'description' => request()->description,
                    'duration' => request()->duration,
                    'topic_id' => request()->topic_id,
                    'course_id' => request()->course_id,
                    'visibility' => request()->visibility,
                    'type' => $type,
                    'video_thumbnail' => $image_name,
                    'video' => $video_file_name,
                    'video_url' => request()->video_url,
                    'audio' => $audio_file_name,
                    'ppt' => $ppt_file_name,
                    'pdf' => $pdf_file_name,
                ]);

                return response()->json([
                    'message' => 'Lesson updated successfully',
                    'lesson' => $lesson
                ]);

            } catch (\Throwable $th) {
                return response()->json([
                    'message' => 'Something went wrong',
                    'error' => $th->getMessage(),
                ]);
            }

        }
    }


    public function deleteLesson() {
        if(request()->ajax()) {
            try {
                $id = request()->id;
                $lesson = Lesson::find($id);
                //unlink  old image
                if($lesson->video_thumbnail) {
                    unlink(public_path($lesson->video_thumbnail));
                }
                if($lesson->video) {
                    unlink(public_path($lesson->video));
                }
                if($lesson->audio) {
                    unlink(public_path($lesson->audio));
                }
                if($lesson->ppt) {
                    unlink(public_path($lesson->ppt));
                }
                if($lesson->pdf) {
                    unlink(public_path($lesson->pdf));
                }

                $lesson->delete();
                
                return response()->json([
                    'message' => 'Lesson deleted successfully',
                    'lesson' => $lesson
                ]);
            } catch (\Throwable $th) {
                return response()->json([
                    'message' => 'Something went wrong',
                    'error' => $th->getMessage()
                ]);
            }
        }
    }
}

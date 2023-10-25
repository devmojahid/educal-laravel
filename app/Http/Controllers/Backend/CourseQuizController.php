<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use Illuminate\Validation\Validator;
use Illuminate\Support\Str;
use App\Models\Quiz;

class CourseQuizController extends Controller
{
    public function getQuiz($courseId) {
        $quizes = Course::find($courseId)->quizzes;

        if($quizes) {
            return view('backend.course.quize.index', compact('courseId', 'quizes'));
        }
        return view('backend.course.quize.index', compact('courseId'));
    }

    public function createQuiz($courseId) {
        $quizes = Course::find($courseId)->quizzes;
        if($quizes) {
            return view('backend.course.quize.create', compact(['courseId', 'quizes']));
        }
    }

    public function storeQuiz(Request $request) {
        try {
            $request->validate([
                'course_id' => 'required',
                'title' => 'required',
                'quiz_duration' => 'required',
                'quiz_status' => 'required',
                'marks_per_question' => 'required',
            ]);
            $slug = Str::slug($request->title);
            $slugCount = Course::find($request->course_id)->quizzes()->where("slug",$slug)->count();
            if($slugCount > 0) {
                $slug = $slug.'-'.time();
            }
            
            $quiz = Course::find($request->course_id)->quizzes()->create([
                'title' => $request->title,
                'slug' => $slug,
                'quiz_duration' => $request->quiz_duration,
                'quiz_status' => $request->quiz_status,
                'marks_per_question' => $request->marks_per_question,
                'quiz_type'=> $request->quiz_type,

            ]);

            $quizId = $quiz->id;

           if($request->quiz_type == 'multiple') {
                return redirect()->route('admin.course.createQuizQuestionData', $quizId);
           }
        } catch (Validator $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
        
    }

    // editQuiz
    public function editQuiz($courseId,$quizId) {
        $quizes = Course::find($quizId)->quizzes->first();
        if($quizes) {
            return view('backend.course.quize.edit', compact('courseId', 'quizes'));
        }
    }

    // updateQuiz
    public function updateQuiz(Request $request) {
        try {
            $request->validate([
                'course_id' => 'required',
                'title' => 'required',
                'quiz_duration' => 'required',
                'quiz_status' => 'required',
                'marks_per_question' => 'required',
            ]);
            $slug = Str::slug($request->title);
            $slugCount = Course::find($request->course_id)->quizzes()->where("slug",$slug)->count();
            if($slugCount > 0) {
                $slug = $slug.'-'.time();
            }
            
            $quiz = Course::find($request->course_id)->quizzes()->update([
                'title' => $request->title,
                'slug' => $slug,
                'quiz_duration' => $request->quiz_duration,
                'quiz_status' => $request->quiz_status,
                'marks_per_question' => $request->marks_per_question,
                'quiz_type'=> $request->quiz_type,

            ]);

            $quizId = $quiz->id;

           if($request->quiz_type == 'multiple') {
                return redirect()->route('admin.course.createQuizQuestionData', $quizId);
           }
        } catch (Validator $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
        
    }
    
    public function deleteQuiz(Request $request) {
        $quiz = Quiz::find($request->id);
        $quiz->delete();
        return response()->json([
            'status'=>'success',
            'message'=>'Quiz deleted successfully !!',
        ]);
    }

}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\Quiz;
use App\Models\QuizeQuestion;

class StudentController extends Controller
{
    //dashboard
    public function dashboard() {
        $courseCounts = OrderItem::where('user_id', auth()->user()->id)
            ->selectRaw('status, COUNT(*) as count')
            ->groupBy('status')
            ->pluck('count', 'status')
            ->toArray();
    
        return view('frontend.student.dashboard', compact('courseCounts'));
    }

    //profile
    public function  profile() {
        $user = auth()->user();
        return view('frontend.student.profile',compact('user'));
    }

    //enrolled course
    public function  enrolledCourse() {
        $orderItems = OrderItem::where('user_id',auth()->user()->id)
        ->where('status','enrolled')
        ->get();
        $enroledsCoursesItems = Course::whereIn('id',$orderItems->pluck('course_id'))->get();
        return view('frontend.student.enrolled-course',compact('enroledsCoursesItems'));
    }

    //active course
    public function  activeCourse() {
        $orderItems = OrderItem::where('user_id',auth()->user()->id)
        ->where('status','active')
        ->get();
        $activeCoursesItems = Course::whereIn('id',$orderItems->pluck('course_id'))->get();
        return view('frontend.student.active-course',compact('activeCoursesItems'));
    }

    //complete course
    public function  completeCourse() {
        $orderItems = OrderItem::where('user_id',auth()->user()->id)
        ->where('status','complete')
        ->get();
        $completeCoursesItems = Course::whereIn('id',$orderItems->pluck('course_id'))->get();
        return view('frontend.student.complete-course',compact('completeCoursesItems'));
    }

    //enrolled course details
    public function  enrolledCourseDetails() {
        return view('frontend.student.enrolled-course-details');
    }

    //settings
    public function  settings() {
        return view('frontend.student.settings');
    }

    //order
    public function  order() {
        $order = Order::with("orderItems")->where('user_id',auth()->user()->id)->get();
        return view('frontend.student.order',compact('order'));
    }

    //learning dashboard
    public function  learningDashboard($slug) {
        $course = Course::where('slug',$slug)->first();
        $orderItem = OrderItem::where('course_id',$course->id)->where('user_id',auth()->user()->id)->first();
        if(!$orderItem) {
            return redirect()->back()->with('error','You are not enrolled in this course');
        }
        $orderItem->update([
            'status' => 'active'
        ]);
        $lessonData = Lesson::where('course_id',$course->id)->first();
        return view('frontend.student.learning-dashboard',compact('course','lessonData'));
    }

    //lesson
    public function  lesson($slug,$id) {
      
        $course = Course::where('slug',$slug)->first();
        $orderItem = OrderItem::where('course_id',$course->id)->where('user_id',auth()->user()->id)->first();
        if(!$orderItem) {
            return redirect()->back()->with('error','You are not enrolled in this course');
        }
        $lessonData = Lesson::where('id',$id)->first();
        return view('frontend.student.learning-dashboard',compact('course','lessonData'));
    }

    //get quiz question
    public function  getQuizQuestion($slug,$id,$quizId) {
        $course = Course::where('slug',$slug)->first();
        $orderItem = OrderItem::where('course_id',$course->id)->where('user_id',auth()->user()->id)->first();
        if(!$orderItem) {
            return redirect()->back()->with('error','You are not enrolled in this course');
        }
        $lessonData = Lesson::where('id',$id)->first();
        $quizQuestions = Quiz::with("questions")->where('id',$quizId)->first();
        return view('frontend.student.learning-dashboard',compact(['course','lessonData','quizQuestions']));
    }

    //submit quiz
    public function  submitQuiz(Request $request,$slug,$id,$quizId) {
        $all_question_answers_values = json_decode($request->quiz_answer,true);
        $marks = 0;
        $attemts = 0;
        $correctAnswer = 0;
        $totalQuestion = $request->total_questions;
        $percentage = 0;

        foreach($all_question_answers_values as $values){
            $questionId = $values['questionId'];
            $answer = $values['answer'];
            $question = QuizeQuestion::find($questionId);
            if($question->answer == $answer){
                $correctAnswer++;
            }
            $attemts++;
        }
        $percentage = ($correctAnswer/$totalQuestion)*100;
        $marks = $correctAnswer * 10;
        $data = [
            'marks' => $marks,
            'totalQuestion' => $totalQuestion,
            'attemts' => $attemts,
            'correctAnswer' => $correctAnswer,
            'percentage' => $percentage,
        ];


        // Redirect back to the previous view
        session()->put('quiz_result', $data);
        return redirect()->back()->with('success', 'Your quiz has been submitted successfully');
    }
}

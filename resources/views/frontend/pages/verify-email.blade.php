@extends('frontend.layouts.guast')
@section("title","Verify Email")
@section("content")
<section class="signup__area sign__bg-wrapper">
    <div class="sign__shape">
       <img class="man-1" src="{{asset('frontend')}}/assets/img/icon/sign/man-1.png" alt="">
       <img class="man-2" src="{{asset('frontend')}}/assets/img/icon/sign/man-2.png" alt="">
       <img class="circle" src="{{asset('frontend')}}/assets/img/icon/sign/circle.png" alt="">
       <img class="zigzag" src="{{asset('frontend')}}/assets/img/icon/sign/zigzag.png" alt="">
       <img class="dot" src="{{asset('frontend')}}/assets/img/icon/sign/dot.png" alt="">
    </div>
    <div class="sign__bg blue-bg-3"></div>
    <div class="container">
       <div class="row">
         <div class="col-xxl-6">
            <div class="sign__bg-content mt-80">
                <div class="sign__bg-logo">
                    <a href="{{ url('/') }}">
                        @if (getOptions('header', 'header_logo') != null)
                            <img src="{{ asset(getOptions('header', 'header_logo')) }}" alt="logo">
                        @endif
                    </a>
                </div>
            </div>
        </div>
          <div class="col-xxl-6 col-xl-6 col-lg-8 mt-180">
             <div class="sign__wrapper white-bg">
               <div class="mb-4 text-sm text-gray-600">
                  {{ __('Thanks for signing up! Before getting started, could you verify your email address by clicking on the link we just emailed to you? If you didn\'t receive the email, we will gladly send you another.') }}
              </div>
          
              @if (session('status') == 'verification-link-sent')
                  <div class="mb-4 font-medium text-sm text-green-600">
                      {{ __('A new verification link has been sent to the email address you provided during registration.') }}
                  </div>
              @endif
                <div class="sign__form">
                  <form method="POST" action="{{ route('verification.send') }}">
                     @csrf
                      <button class="e-btn  w-100"> <span></span> {{ __('Resend Verification Email') }}</button>
                      <div class="sign__new text-center mt-20">
                        <form method="POST" action="{{ route('logout') }}">
                           @csrf
                           <button type="submit">
                               {{ __('Log Out') }}
                           </button>
                       </form>
                      </div>
                   </form>
                </div>
             </div>
          </div>
       </div>
    </div>
 </section>
 @endsection
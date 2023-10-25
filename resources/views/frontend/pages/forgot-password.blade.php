@extends('frontend.layouts.guast')
@section("title","Forgot Password")
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
                  {{ __('Forgot your password? No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.') }}
              </div>
                <div class="sign__form">
                  <form method="POST" action="{{ route('password.email') }}">
                     @csrf
                     <div class="sign__input-wrapper mb-25">
                        <h5>Your email</h5>
                        <div class="sign__input">
                           <input type="email" name="email" class="@error('email') is-invalid @enderror" value="{{ old('email') }}" required autocomplete="username" placeholder="e-mail address">
                           <i class="fal fa-envelope"></i>
                        </div>
                        @error('email')
                             <div class="alert alert-danger mt-2">{{ $message }}</div>
                          @enderror
                     </div>
                      <button class="e-btn  w-100">  {{ __('Email Password Reset Link') }}</button>
                   </form>
                </div>
             </div>
          </div>
       </div>
    </div>
 </section>
 @endsection
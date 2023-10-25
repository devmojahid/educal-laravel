@extends('frontend.layouts.guast')
@section("title","Reset Password")
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
             <div class="sign__wrapper white-bg ">
                <div class="sign__form">
                  <form method="POST" action="{{ route('password.store') }}">
                     @csrf
                     <input type="hidden" name="token" value="{{ $request->route('token') }}">
                     <div class="sign__input-wrapper mb-25">
                        <h5>Your email</h5>
                        <div class="sign__input">
                           <input type="email" name="email" class="@error('email') is-invalid @enderror" value="{{ old('email', $request->email) }}" required autocomplete="username" placeholder="e-mail address">
                           <i class="fal fa-envelope"></i>
                        </div>
                        @error('email')
                             <div class="alert alert-danger mt-2">{{ $message }}</div>
                          @enderror
                     </div>
                     <div class="sign__input-wrapper mb-25">
                        <h5>Password</h5>
                        <div class="sign__input">
                           <input type="password" name="password" class="@error('password') is-invalid @enderror" required autocomplete="new-password" placeholder="Password">
                           <i class="fal fa-lock"></i>
                        </div>
                        @error('password')
                          <div class="alert alert-danger mt-2">{{ $message }}</div>
                          @enderror
                     </div>
                     <div class="sign__input-wrapper mb-10">
                        <h5>Confirm Password</h5>
                        <div class="sign__input">
                           <input type="password" class="@error('password_confirmation') is-invalid @enderror" name="password_confirmation" required autocomplete="new-password" placeholder="Confirm Password">
                           <i class="fal fa-lock"></i>
                        </div>
                        @error('password_confirmation')
                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                        @enderror
                     </div>
                      <button class="e-btn  w-100">  {{ __('Reset Password') }}</button>
                   </form>
                </div>
             </div>
          </div>
       </div>
    </div>
 </section>
 @endsection
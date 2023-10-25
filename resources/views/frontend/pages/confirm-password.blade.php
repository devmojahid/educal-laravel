@extends("frontend.layouts.master")
@section("title","Confirm Password")
@section("content")
<section class="signup__area po-rel-z1 pt-100 pb-145">
    <div class="sign__shape">
       <img class="man-1" src="{{asset('frontend')}}/assets/img/icon/sign/man-1.png" alt="">
       <img class="man-2" src="{{asset('frontend')}}/assets/img/icon/sign/man-2.png" alt="">
       <img class="circle" src="{{asset('frontend')}}/assets/img/icon/sign/circle.png" alt="">
       <img class="zigzag" src="{{asset('frontend')}}/assets/img/icon/sign/zigzag.png" alt="">
       <img class="dot" src="{{asset('frontend')}}/assets/img/icon/sign/dot.png" alt="">
    </div>
    <div class="container">
       <div class="row">
          <div class="col-xxl-6 offset-xxl-3 col-xl-6 offset-xl-3 col-lg-8 offset-lg-2">
             <div class="sign__wrapper white-bg">
               <div class="mb-4 text-sm text-gray-600">
                  {{ __('This is a secure area of the application. Please confirm your password before continuing.') }}
              </div>
                <div class="sign__form">
                  <form method="POST" action="{{ route('password.email') }}">
                     @csrf
                        <div class="sign__input-wrapper mb-25">
                           <h5>Password</h5>
                           <div class="sign__input">
                              <input type="password" name="password" class="@error('password') is-invalid @enderror" required autocomplete="current-password" placeholder="Password">
                              <i class="fal fa-lock"></i>
                           </div>
                           @error('password')
                              <div class="alert alert-danger mt-2">{{ $message }}</div>
                           @enderror
                        </div>
                      <button class="e-btn  w-100">{{ __('Confirm') }}</button>
                   </form>
                </div>
             </div>
          </div>
       </div>
    </div>
 </section>
 @endsection
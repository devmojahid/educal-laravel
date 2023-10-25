@extends('frontend.layouts.guast')
@section('title', 'Register Now')
@section('content')
    <section class="signup__area sign__bg-wrapper">
        <div class="sign__shape">
            <img class="man-1" src="{{ asset('frontend') }}/assets/img/icon/sign/man-3.png" alt="">
            <img class="man-2 man-22" src="{{ asset('frontend') }}/assets/img/icon/sign/man-2.png" alt="">
            <img class="circle" src="{{ asset('frontend') }}/assets/img/icon/sign/circle.png" alt="">
            <img class="zigzag" src="{{ asset('frontend') }}/assets/img/icon/sign/zigzag.png" alt="">
            <img class="dot" src="{{ asset('frontend') }}/assets/img/icon/sign/dot.png" alt="">
            <img class="flower" src="{{ asset('frontend') }}/assets/img/icon/sign/flower.png" alt="">
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
                <div class="col-xxl-6 col-xl-6 col-lg-8">
                    <div class="section__title-wrapper text-center mb-20">
                        <h2 class="section__title">Create a free <br> Account</h2>
                        <p>I'm a subhead that goes with a story.</p>
                    </div>
                    <div class="sign__wrapper white-bg">
                        <div class="sign__form">
                            <form method="POST" action="{{ route('register') }}">
                                @csrf
                                <div class="sign__input-wrapper mb-25">
                                    <h5>First Name</h5>
                                    <div class="sign__input">
                                        <input type="text" name="first_name"
                                            class="@error('first_name') is-invalid @enderror" placeholder="Mojahid"
                                            value="{{ old('first_name') }}" required autofocus autocomplete="name">
                                        <i class="fal fa-user"></i>
                                    </div>
                                    @error('first_name')
                                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="sign__input-wrapper mb-25">
                                    <h5>Last Name</h5>
                                    <div class="sign__input">
                                        <input type="text" name="last_name"
                                            class="@error('last_name') is-invalid @enderror" placeholder="Islam"
                                            value="{{ old('last_name') }}" required autofocus autocomplete="name">
                                        <i class="fal fa-user"></i>
                                    </div>
                                    @error('last_name')
                                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="sign__input-wrapper mb-25">
                                    <h5>Work email</h5>
                                    <div class="sign__input">
                                        <input type="email" name="email" class="@error('email') is-invalid @enderror"
                                            value="{{ old('email') }}" required autocomplete="username"
                                            placeholder="e-mail address">
                                        <i class="fal fa-envelope"></i>
                                    </div>
                                    @error('email')
                                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="sign__input-wrapper mb-25">
                                    <h5>Password</h5>
                                    <div class="sign__input">
                                        <input type="password" name="password"
                                            class="@error('password') is-invalid @enderror" required
                                            autocomplete="new-password" placeholder="Password">
                                        <i class="fal fa-lock"></i>
                                    </div>
                                    @error('password')
                                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="sign__input-wrapper mb-10">
                                    <h5>Re-Password</h5>
                                    <div class="sign__input">
                                        <input type="password" class="@error('password_confirmation') is-invalid @enderror"
                                            name="password_confirmation" required autocomplete="new-password"
                                            placeholder="Re-Password">
                                        <i class="fal fa-lock"></i>
                                    </div>
                                    @error('password_confirmation')
                                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="sign__action d-flex justify-content-between mb-30">
                                    <div class="sign__agree d-flex align-items-center">
                                        <input class="m-check-input" type="checkbox" id="m-agree">
                                        <label class="m-check-label" for="m-agree">I agree to the <a href="#">Terms &
                                                Conditions</a>
                                        </label>
                                    </div>
                                </div>
                                <button type="submit" class="e-btn w-100"> <span></span> Sign Up</button>
                                <div class="sign__new text-center mt-20">
                                    <p>Already in Educal ? <a href="{{ route('login') }}"> Sign In</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

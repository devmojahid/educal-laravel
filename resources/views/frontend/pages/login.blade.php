@extends('frontend.layouts.guast')
@section('title', 'Login Now')
@section('content')
    <section class="signup__area sign__bg-wrapper">
        <div class="sign__shape">
            <img class="man-1" src="{{ asset('frontend') }}/assets/img/icon/sign/man-1.png" alt="">
            <img class="man-2" src="{{ asset('frontend') }}/assets/img/icon/sign/man-2.png" alt="">
            <img class="circle" src="{{ asset('frontend') }}/assets/img/icon/sign/circle.png" alt="">
            <img class="zigzag" src="{{ asset('frontend') }}/assets/img/icon/sign/zigzag.png" alt="">
            <img class="dot" src="{{ asset('frontend') }}/assets/img/icon/sign/dot.png" alt="">
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
                    <div class="section__title-wrapper text-center mb-20 mt-70">
                        <h2 class="section__title">Sign in to <br> recharge direct.</h2>
                        <p>it you don't have an account you can Register</p>
                    </div>
                    <div class="sign__wrapper white-bg">
                        <div class="sign__form">
                            <form method="POST" action="{{ route('login') }}">
                                @csrf
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
                                            autocomplete="current-password" placeholder="Password">
                                        <i class="fal fa-lock"></i>
                                    </div>
                                    @error('password')
                                        <div class="alert alert-danger mt-2">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="sign__action d-sm-flex justify-content-between mb-30">
                                    <div class="sign__agree d-flex align-items-center">
                                        <input class="m-check-input" name="remember" type="checkbox" id="m-agree">
                                        <label class="m-check-label" for="m-agree">Keep me signed in
                                        </label>
                                    </div>
                                    @if (Route::has('password.request'))
                                        <div class="sign__forgot">
                                            <a
                                                href="{{ route('password.request') }}">{{ __('Forgot your password?') }}</a>
                                        </div>
                                    @endif
                                </div>
                                <button class="e-btn  w-100"> <span></span> Sign In</button>
                                <div class="sign__new text-center mt-20">
                                    <p>New to Educal <a href="{{ route('register') }}">Sign Up</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

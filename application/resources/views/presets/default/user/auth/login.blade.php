@extends($activeTemplate . 'layouts.auth')
@section('content')
    <!--=======-** Login start **-=======-->
    <section class="account bg-img login py-80 position-relative">
        <div class="account-inner">
            <div class="container">
                <div class="row gy-4 justify-content-center">
                    <div class="col-lg-6">
                        <div class="account-form login-wrapper">
                            <div class="account-form__content mb-4">
                                <div class="logo-wrapper">
                                    <a href="{{ route('home') }}" class="normal-logo"> <img
                                            src="{{ getImage(getFilePath('logoIcon') . '/logo.png', '?' . time()) }}"
                                            alt="{{ config('app.name') }}"></a>
                                    <a href="{{ route('home') }}" class="dark-logo hidden"> <img
                                            src="{{ getImage(getFilePath('logoIcon') . '/logo_white.png', '?' . time()) }}"
                                            alt="{{ config('app.name') }}"></a>
                                </div>
                                <h2 class="account-form__title-heading mb-2 text-center"> @lang('Welcome to')
                                    {{ __($general->site_name) }} </h2>
                            </div>
                            <div class="account-form__content mb-4">
                                <h3 class="account-form__title mb-2">@lang('Login')</h3>
                            </div>
                            <form method="POST" action="{{ route('user.login') }}" class="verify-gcaptcha">
                                @csrf
                                <div class="row gy-3">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="username" class="form--label"> @lang('Username or Email')</label>
                                            <input type="text" class="form--control" id="username" name="username" value="{{ old('username') }}" placeholder="@lang('User Name  Or Email')" required>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <label for="your-password" class="form--label">@lang('Password')</label>
                                        <div class="input-group">
                                            <input id="your-password" type="password" class="form-control form--control" name="password" placeholder="@lang('Password')"
                                            required>
                                            <div class="password-show-hide fas fa-lock" id="#your-password"></div>
                                        </div>
                                    </div>
                                    <x-captcha></x-captcha>

                                    <div class="col-sm-12">
                                        <div class="d-flex flex-wrap justify-content-between">
                                            <div class="form--check">
                                                <input class="form-check-input" type="checkbox" name="remember" id="remember"
                                                {{ old('remember') ? 'checked' : '' }}>
                                                <label class="form-check-label" for="remember">@lang('Remember me')</label>
                                            </div>
                                            <a href="{{ route('user.password.request') }}" class="forgot-password text--base">@lang('Forgot Your Password?')</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn--base pill w-100" id="recaptcha">
                                            @lang('Sign In') <i class="fas fa-arrow-right"></i>
                                            <span style="top: 40.6094px; left: 80px;"></span>
                                        </button>
                                    </div>
                                    <h6 class="text-center">@lang('Or continue with')</h6>

                                    <div class="login-with">
                                        <div class="single-button mb-2">
                                            <a href="#" class="left-sidebar-menu__link btn btn--base pill">
                                                <i class="fa-brands fa-google me-3"></i>Google
                                            </a>
                                        </div>
                                        <div class="single-button mb-2">
                                            <a href="#" class="left-sidebar-menu__link btn btn--base pill">
                                                <i class="fab fa-facebook-f me-3"></i> Facebook
                                            </a>
                                        </div>
                                        <div class="single-button mb-2">
                                            <a href="#" class="left-sidebar-menu__link btn btn--base pill">
                                                <i class="fab fa-twitter me-3"></i> Twitter
                                            </a>
                                        </div>
                                        <div class="single-button mb-2">
                                            <a href="#" class="left-sidebar-menu__link btn btn--base pill">
                                                <i class="fab fa-linkedin-in me-3"></i> Linkedin
                                            </a>
                                        </div>
                                        <div class="single-button mb-2">
                                            <a href="#" class="left-sidebar-menu__link btn btn--base pill">
                                                <i class="fab fa-instagram me-3"></i> Instagram
                                            </a>
                                        </div>
                                        <div class="single-button mb-2">
                                            <a href="#" class="left-sidebar-menu__link btn btn--base pill">
                                                <i class="fa-brands fa-reddit-alien me-3"></i> Reddit
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="have-account text-center">
                                            <p class="have-account__text">@lang('Don\'t have any account?') <a href="{{ route('user.register') }}" class="have-account__link text--base">@lang('Create Account')</a></p>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--=======-** Login End **-=======-->
@endsection

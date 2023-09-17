@extends($activeTemplate . 'layouts.auth')
@section('content')
    @php
        $policyPages = getContent('policy_pages.element', false, null, true);
    @endphp
 <!-- Registration Start Here  -->
<section class="account bg-img login py-80 position-relative" style="background-image: url(../../assets/images/login/loging-bg.jpg);">
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
                            <h3 class="account-form__title mb-2">@lang('Sign Up')</h3>
                        </div>
                        <form action="{{ route('user.register') }}" method="POST" class="verify-gcaptcha">
                            @csrf
                            <div class="row gy-3">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="name" class="form--label"> @lang('Username')</label>
                                       <input type="text" class="form--control checkUser" id="username" name="username" value="{{ old('username') }}" placeholder="@lang('Username')" required>
                                       <small class="text-danger usernameExist"></small>
                                    </div>
                               </div>
                               <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="email" class="form--label">@lang('E-Mail Address')</label>
                                       <input type="email" class="form--control checkUser" id="email" name="email" value="{{ old('email') }}" placeholder="@lang('Email')" required>
                                    </div>
                               </div>

                               <div class="col-sm-6">
                                   <label for="your-password" class="form--label">@lang('Password')</label>
                                   <div class="input-group">
                                       <input id="your-password" type="password" class="form-control form--control" name="password" placeholder="@lang('Password')" required>
                                       <div class="password-show-hide fas fa-lock" id="#your-password"></div>
                                   </div>
                               </div>
                               <div class="col-sm-6">
                                   <label for="confirm-password" class="form--label">@lang('Confirm Password')</label>
                                   <div class="input-group">
                                       <input id="confirm-password" type="password" class="form-control form--control" name="password_confirmation" placeholder="@lang('Confirm Password')" required>
                                       <div class="password-show-hide fas fa-lock" id="#confirm-password"></div>
                                   </div>
                               </div>
                               <x-captcha></x-captcha>
                               @if($general->agree)
                               <div class="col-sm-12">
                                   <div class="form--check">
                                       <input class="form-check-input" type="checkbox" id="agree" @checked(old('agree')) name="agree" required>
                                       <div class="form-check-label">
                                           <label class="" for="remember"> @lang('I agree with') @foreach($policyPages as $policy)</label>
                                           <a href="{{ route('policy.pages',[slug($policy->data_values->title),$policy->id]) }}" class="text--base">{{ __($policy->data_values->title) }}</a>
                                           <label class="" for="remember"> @if(!$loop->last) @endif @endforeach </label>
                                       </div>
                                   </div>
                               </div>
                               @endif
                               <div class="col-sm-6">
                                   <button type="submit" class="btn btn--base pill w-100" id="recaptcha">
                                       @lang('Sign Up') <i class="fa-sharp fas fa-arrow-right"></i>
                                       <span style="top: -1px; left: 369px;"></span>
                                   </button>
                               </div>
                                <div class="col-sm-12">
                                    <div class="have-account text-center">
                                        <p class="have-account__text">@lang('Already Have An Account')? <a href="{{route('user.login')}}" class="have-account__link text--base">@lang('Login Now')</a></p>
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
<!-- Registration End Here  -->

<div class="modal fade" id="existModalCenter" tabindex="-1" role="dialog" aria-labelledby="existModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="existModalLongTitle">@lang('You are with us')</h5>
          <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
              <i class="las la-times"></i>
          </span>
        </div>
        <div class="modal-body">
          <h6 class="text-center">@lang('You already have an account please Login ')</h6>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-dark btn-sm" data-bs-dismiss="modal">@lang('Close')</button>
          <a href="{{ route('user.login') }}" class="btn btn--base btn-sm">@lang('Login')</a>
        </div>
      </div>
    </div>
  </div>
@endsection

@push('script')
    <script>
        (function($) {
            "use strict";
            
            $('.checkUser').on('focusout', function(e) {
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';
                if ($(this).attr('name') == 'mobile') {
                    var mobile = `${$('.mobile-code').text().substr(1)}${value}`;
                    var data = {
                        mobile: mobile,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'email') {
                    var data = {
                        email: value,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'username') {
                    var data = {
                        username: value,
                        _token: token
                    }
                }
                $.post(url, data, function(response) {
                    if (response.data != false && response.type == 'email') {
                        $('#existModalCenter').modal('show');
                    } else if (response.data != false) {
                        $(`.${response.type}Exist`).text(`${response.type} already exist`);
                    } else {
                        $(`.${response.type}Exist`).text('');
                    }
                });
            });
        })(jQuery);
    </script>
@endpush

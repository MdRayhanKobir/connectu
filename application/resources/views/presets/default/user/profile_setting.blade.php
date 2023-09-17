@extends($activeTemplate.'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="hot-topic-wrapper account-settings">
        <div class="hot-topic-item heading">
            <h6 class="title">@lang('General Settings')</h6>
        </div>
        <div class="hot-topic-item">
            <h6 class="title">{{__($pageTitle)}}</h6>
        </div>

        <div class="hot-topic-item">
            <form action="" method="post" enctype="multipart/form-data">
                @csrf
                <div class="row gy-3">

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="firstname" class="form--label">@lang('First Name')</label>
                            <input type="text" class="form--control" id="firstname" name="firstname"
                            value="{{$user->firstname}} "required>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="lastname" class="form--label">@lang('Last Name')</label>
                            <input type="text" class="form--control"  id="lastname"name="lastname"
                            value="{{$user->lastname}}" required>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="username" class="form--label">@lang('User Name')</label>
                            <input type="text" class="form--control" id="username" placeholder="@lang('Username')" name="username" value="{{$user->username}}" required readonly>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="email" class="form--label">@lang('Email Address')</label>
                            <input type="text" class="form--control" id="email" name="email" value="{{$user->email}}" readonly>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="email" class="form--label">@lang('Email Address')</label>
                            <input type="text" class="form--control" id="email" name="email" value="{{$user->email}}" readonly>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <label for="country" class="form--label">@lang('Country')</label>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <select name="country" class="form--control">
                                    @foreach($countries as $key => $country)
                                        <option {{(@$user->address->country == $country->country) ? 'selected' : ''}}  data-mobile_code="{{ $country->dial_code }}" value="{{ $country->country }}" data-code="{{ $key }}">{{ __($country->country) }}</option>
                                    @endforeach
                                </select>
                           </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <label class="form--label" for="mobile">@lang('Mobile Optional') : {{@$user->mobile}}</label>
                        <div class="input-group">
                            <div class="input-group country-code">
                                <span class="input-group-text mobile-code">
                                </span>
                                <input type="hidden" name="mobile_code">
                                <input type="hidden" name="country_code">
                                <input type="number" name="mobile" @if(@$user->mobile)  @endif  class="form--control checkUser">
                            </div>
                            <small class="text-danger mobileExist"></small>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="address" class="form--label">@lang('Address')</label>
                            <input type="text" class="form--control" id="address" name="address"
                            value="{{@$user->address->address}}">
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="state" class="form--label">@lang('State')</label>
                            <input type="text" class="form--control" id="state" name="state"
                            value="{{@$user->address->state}}">
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="zip" class="form--label">@lang('Zip Code')</label>
                            <input type="text" class="form--control" id="zip" name="zip"
                            value="{{@$user->address->zip}}">
                        </div>
                    </div>

                    <div class="col-lg-12 col-sm-12">
                        <div class="form-group">
                            <label for="city" class="form--label">@lang('City')</label>
                            <input type="text" class="form--control" id="city" name="city"
                            value="{{@$user->address->city}}">
                        </div>
                    </div>

                    <div class="col-lg-12 mb-4">
                        <button type="submit" class="btn btn--base pill w-100 justify-content-center">
                            <span class="me-2"><i class="fa-solid fa-angles-left"></i></span> @lang('Submit')
                        </button>
                    </div>

                </div>
            </form>
        </div>


        <div class="hot-topic-item">
            <h6 class="title">@lang('Change Password')</h6>
        </div>
        <div class="hot-topic-item">
            <form action="{{route('user.change.password.submit')}}" method="post">
                @csrf
            <div class="row gy-3">
                <div class="col-sm-12">
                    <label for="your-password" class="form--label required">@lang('Old Password')</label>
                    <div class="input-group">
                        <input id="current_password" type="password" class="form--control" name="current_password" placeholder="" required>
                        <div class="password-show-hide fas p_toggle-password-change fa-eye-slash" data-target="current_password"></div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <label for="new-password" class="form--label required">@lang('New Password')</label>
                    <div class="input-group">
                        <input id="password" type="password" class="form--control" name="password" placeholder="" required>
                        <div class="password-show-hide fas p_toggle-password-change fa-eye-slash" data-target="password"></div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <label for="again-your-password" class="form--label required">@lang('Confirm Password')</label>
                    <div class="input-group">
                        <input id="password_confirmation" type="password" class="form--control" name="password_confirmation" placeholder="" required>
                        <div class="password-show-hide fas p_toggle-password-change fa-eye-slash" data-target="password_confirmation"></div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <button type="submit" class="btn btn--base pill w-100 justify-content-center">
                        <span class="me-2"><i class="fa-solid fa-angles-left"></i></span>@lang('Change Password')
                    </button>
                </div>
            </div>
        </form>
        </div>
    </div>
</div>
@endsection

@push('script')
    <script>
      "use strict";
        (function ($) {
            @if($mobileCode)
            $(`option[data-code={{ $mobileCode }}]`).attr('selected','');
            @endif
            $('select[name=country]').change(function(){
                $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
                $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
                $('.mobile-code').text('+'+$('select[name=country] :selected').data('mobile_code'));
            });
            $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
            $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
            $('.mobile-code').text('+'+$('select[name=country] :selected').data('mobile_code'));

            $('.checkUser').on('focusout',function(e){
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';
                if ($(this).attr('name') == 'mobile') {
                    var mobile = `${$('.mobile-code').text().substr(1)}${value}`;
                    var data = {mobile:mobile,_token:token}
                }
                if ($(this).attr('name') == 'email') {
                    var data = {email:value,_token:token}
                }
                if ($(this).attr('name') == 'username') {
                    var data = {username:value,_token:token}
                }
                $.post(url,data,function(response) {
                  if (response.data != false && response.type == 'email') {
                    $('#existModalCenter').modal('show');
                  }else if(response.data != false){
                    $(`.${response.type}Exist`).text(`${response.type} already exist`);
                  }else{
                    $(`.${response.type}Exist`).text('');
                  }
                });
            });


            // password
            $(".p_toggle-password-change").on('click', function() {
                var targetId = $(this).data("target");
                var target = $("#" + targetId);
                var icon = $(this);
                if (target.attr("type") === "password") {
                    target.attr("type", "text");
                    icon.removeClass("fa-eye-slash");
                    icon.addClass("fa-eye");
                } else {
                    target.attr("type", "password");
                    icon.removeClass("fa-eye");
                    icon.addClass("fa-eye-slash");
                }
            });

        })(jQuery);
    </script>
@endpush

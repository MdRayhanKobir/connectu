@extends($activeTemplate.'layouts.frontend')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7 col-xl-5">
            <div class="text-end">
                <a href="{{ route('home') }}" class="fw-bold home-link"> <i class="las la-long-arrow-alt-left"></i>
                    @lang('Go to Home')</a>
            </div>
            <div class="card custom--card">
                <div class="card-header">
                    <h5 class="card-title">{{ __($pageTitle) }}</h5>
                </div>
                <div class="card-body">
                    <form method="post" action="" class="verify-gcaptcha">
                        @csrf
                        <div class="form-group">
                            <label class="form-label">@lang('Name')</label>
                            <input name="name" type="text" class="form-control form--control"
                                value="@if(auth()->user()){{ auth()->user()->fullname }} @else{{ old('name') }}@endif"
                                @if(auth()->user()) readonly @endif required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">@lang('Email')</label>
                            <input name="email" type="email" class="form-control form--control"
                                value="@if(auth()->user()){{ auth()->user()->email }}@else{{  old('email') }}@endif"
                                @if(auth()->user()) readonly @endif required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">@lang('Subject')</label>
                            <input name="subject" type="text" class="form-control form--control"
                                value="{{old('subject')}}" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label">@lang('Message')</label>
                            <textarea name="message" wrap="off" class="form-control form--control"
                                required>{{old('message')}}</textarea>
                        </div>
                        <x-captcha></x-captcha>
                        <div class="form-group">
                            <button type="submit" class="btn btn--base w-100">@lang('Save')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
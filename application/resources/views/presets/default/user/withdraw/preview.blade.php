@extends($activeTemplate.'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="hot-topic-wrapper account-settings">
        <div class="hot-topic-item heading">
            <h6 class="title">@lang('Withdraw Via') {{ $withdraw->method->name }}</h6>
        </div>
        <div class="hot-topic-item">
            <form action="{{route('user.withdraw.submit')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="mb-2">
                    @php
                    echo $withdraw->method->description;
                    @endphp
                </div>
                <x-custom-form identifier="id" identifierValue="{{ $withdraw->method->form_id }}"></x-custom-form>
                @if(auth()->user()->ts)
                <div class="form-group">
                    <label>@lang('Google Authenticator Code')</label>
                    <input type="text" name="authenticator_code" class="form--control" required>
                </div>
                @endif
                <div class="form-group">
                    <button type="submit" class="btn btn--base pill w-100 mt-3">@lang('Submit')</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

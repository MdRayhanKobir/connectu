@extends($activeTemplate .'layouts.auth')
@section('content')
<div class="container">
    <div class="row d-flex justify-content-center vh-100 align-items-center">
        <div class="col-md-6 account-form">
            <div class="card custom--card">
                <div class="card-body">
                    <h3 class="text-center text-danger">@lang('You are banned')</h3>
                    <p class="fw-bold mb-1">@lang('Reason'):</p>
                    <p>{{ $user->ban_reason }}</p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

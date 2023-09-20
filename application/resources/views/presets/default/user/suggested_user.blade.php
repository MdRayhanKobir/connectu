@extends($activeTemplate . 'layouts.master')
@section('content')
<div class="timeline-mt-60">
    @foreach($users as $user)
    <div class="timeline-single-post-wrap">
        <div class="timeline-single-post">
            <div class="timeline-single-post__avatar-wrap">
                <div class="avatar">
                    <a href=""><img src="{{ getImage(getFilePath('userProfile') . '/' . @$user->image, getFileSize('userProfile')) }}" alt="@lang('user profile')"></a>
                </div>
            </div>
            <div class="timeline-single-post__content d-flex justify-content-between">
                <div class="timeline-single-post__content-top-wrapper">
                    <div class="single-user-profile__content">
                        <div class="top single-user">
                            <h5 class="mb-0"> <a href="">
                                {{__($user->fullname)}}<i class="fa-solid fa-circle-check"></i></a>
                            </h5>
                        </div>
                        <div class="followers d-flex mb-0">
                            <p>{{__($user->posts->count())}} @lang('Post') </p>
                            <p>10 Following</p>
                            <p>6.5M Followers</p>
                        </div>
                        <div class="bottom">
                            <div class="total-followers">
                                <p>Has 5 followers you know</p>
                                <div class="avatar-wrapper alluser-avatar">
                                    <a href=""> <img src="assets/images/avatar/obaydul.png" alt=""></a>
                                    <a href=""> <img src="assets/images/avatar/obaydul.png" alt=""></a>
                                    <a href=""> <img src="assets/images/avatar/obaydul.png" alt=""></a>
                                    <a href=""> <img src="assets/images/avatar/obaydul.png" alt=""></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="follow-wrapper">
                    <button class="btn btn--base btn--sm pill btn--rev">
                        Follow
                    </button>
                </div>
            </div>
        </div>
    </div>
    @endforeach
</div>
@endsection

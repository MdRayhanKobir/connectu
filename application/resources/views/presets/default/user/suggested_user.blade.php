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
                            <p>{{__($user->following_count)}} @lang('Following')</p>
                            <p>{{__($user->followers_count)}} @lang('Followers')</p>
                        </div>
                    </div>
                </div>
                <div class="follow-wrapper">
                    @if (auth()->user()->isFollowing($user))
                        <a  href="{{ route('user.unfollow', $user->id) }}" class="btn btn--base btn--sm pill btn--rev">
                            @lang('Unfollow')
                        </a>
                    @else
                        <a href="{{ route('user.follow', $user->id) }}" class="btn btn--base btn--sm pill btn--rev">
                            @lang('Follow')
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
    @endforeach
</div>
@endsection

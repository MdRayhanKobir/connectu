@extends($activeTemplate .'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="notification-wrapper">
        @forelse($notifications as $notification)
            <div class="notification-item">
                <div class="notification-item__left">
                    <div class="thumb">
                        <a href="single-user.html">
                            <img src="{{ getImage(getFilePath('userProfile') . '/' . @$notification->fromUser->image, getFileSize('userProfile')) }}"  alt="@lang('user profile')">
                        </a>
                    </div>
                    <div class="content">
                        <h5 class="name">
                            <a href="single-user.html">{{__(@$notification->fromUser->fullname)}} <span>{{diffForHumans($notification->created_at)}}</span></a>
                        </h5>
                        <a href="{{route('user.notification.read',$notification->id)}}"><p> {{__($notification->title)}}</p></a>
                    </div>
                </div>
                <div class="notification-item__right">
                    <a href="{{route('user.notification.read',$notification->id)}}"><i class="fas fa-angle-right"></i></a>
                </div>
            </div>

            @if($notifications->hasPages())
            <div class="text-end">
                {{ $notifications->links() }}
            </div>
            @endif

            @empty
            <p class="text-center mt-3">{{__($emptyMessage)}}</p>
        @endforelse

    </div>
</div>
@endsection

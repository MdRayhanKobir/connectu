@extends($activeTemplate .'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="notification-wrapper">
        @forelse($archiveposts as $post)
            <div class="notification-item">
                <div class="notification-item__left">
                    <div class="content">
                        <p>
                            @if(!empty($post->text))
                                @if (strlen(__($post->text)) > 20)
                                            {{ substr(__($post->text), 0, 20) . '...' }}
                                @else
                                    {{ __($post->text) }}
                                @endif
                            @else
                                {{showDateTime($post->created_at)}}
                            @endif
                        </p>
                    </div>
                </div>
                <div class="notification-item__right">
                    <a href="{{route('user.get.restore.post',$post->id)}}"><i class="fas fa-trash"></i></a>
                </div>
            </div>

            @if($archiveposts->hasPages())
            <div class="text-end">
                {{ $archiveposts->links() }}
            </div>
            @endif

            @empty
            <p class="text-center mt-3">{{__($emptyMessage)}}</p>
        @endforelse

    </div>
</div>
@endsection

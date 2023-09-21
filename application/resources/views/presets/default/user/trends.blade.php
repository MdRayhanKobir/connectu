@extends($activeTemplate . 'layouts.master')
@section('content')

<div class="timeline-mt-60">
    <div class="hot-topic-wrapper">
        @foreach($hashtags as $hashtag)
            <div class="hot-topic-item">
                <a href="{{route('user.post.fetch.hashtag',$hashtag->tag)}}">
                    <div class="left-arrow">
                        <div class="has-text"><i class="fas fa-hashtag"></i> <span>{{ ucfirst(__($hashtag->tag)) }}
                        </span> </div>
                        <div class="post-count">{{__($hashtag->post)}} @lang('posts') </div>
                    </div>
                    <div class="right-arrow">
                        <i class="fas fa-angle-right"></i>
                    </div>
                </a>
            </div>
        @endforeach
    </div>

</div>
@endsection

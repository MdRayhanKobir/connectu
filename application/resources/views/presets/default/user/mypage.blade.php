@extends($activeTemplate . 'layouts.master')
@section('content')
<div class="single-user-profile timeline-mt-60">
    <div class="single-user-profile__thumb-wrap">
        <div class="thumb">
            <img src="{{ getImage(getFilePath('userCoverImage') . '/' . @$user->cover_image, getFileSize('userCoverImage')) }}" alt="@lang('cover image')">
            <form action="{{ route('user.profile.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="sidebar-user-wrap__thumb">
                    <img src="{{ getImage(getFilePath('userProfile') . '/' . @$user->image, getFileSize('userProfile')) }}" alt="@lang('user profile')">
                    <div class="photo_upload profile">
                        <label for="image"><i class="fas fa-camera"></i></label>
                        <input type="file" name="image" class="upload_file" onchange="this.form.submit()">
                    </div>
                </div>
            </form>

            <form action="{{ route('user.cover.image') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="photo_upload cover-pic">
                    <label for="cover_image"><i class="fas fa-camera"></i></label>
                    <input  id="submitButton"  name="cover_image" class="upload_file" type="file" onchange="this.form.submit()">
                </div>
            </form>

        </div>

    </div>
    <div class="single-user-profile__content padd-x-y">
        <div class="single-user-profile__control">
            <div class="timeline-single-post__content-top-wrapper">
                <div class="avatar-content">
                    <div class="single-item-menu">
                        <button>
                            <i class="fas fa-ellipsis-h"></i>
                        </button>
                        <ul class="post-top-menu">
                            <li class="post-top-menu__item">
                                <a class="post-top-menu__link" href="javascript:void(0)" onclick="copyProfileLink()">
                                    <span class="icon"><i class="fas fa-copy"></i></span>
                                    <span class="text">@lang('Profile Link Copy')</span>
                                </a>
                            </li>

                            <li class="post-top-menu__item">
                                <a class="post-top-menu__link" href="{{route('user.suggested')}}">
                                    <span class="icon"><i class="fas fa-user"></i></span>
                                    <span class="text">@lang('Find Users')</span>
                                </a>
                            </li>


                            <li class="post-top-menu__item">
                                <a class="post-top-menu__link" href="{{route('user.get.archive.post')}}">
                                    <span class="icon"><i class="fas fa-trash"></i></span>
                                    <span class="text">@lang('All archive post')</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="item">
                <a href="chat-message.html">
                    <i class="far fa-comment-alt"></i>
                </a>
            </div>
            @if(auth()->user())
            @else
            <div class="item">
                <a href="{{ route('user.follow', $user->id) }}" class="btn btn--base btn--sm pill btn--rev">
                    @lang('Follow')
                </a>
            </div>
            @endif
        </div>
        <div class="top">
            <h5>
                {{__($user->fullname)}}
                <span class="mt-1"> @ {{__($user->username)}}</span>
            </h5>
        </div>
        <div class="followers">
            <a href="javascript:void(0)"> <span>{{__(@$user->post_count)}}</span> @lang('Post')</a>
            <a href="javascript:void(0)"><span>{{__(@$user->following_count)}}</span> @lang('Following')</a>
            <a href="javascript:void(0)"><span>{{__(@$user->followers_count)}}</span> @lang('Followers')</a>
        </div>
    </div>
</div>

@foreach ($posts as $item)
<div class="timeline-single-post-wrap">
    <div class="timeline-single-post">
        <div class="timeline-single-post__avatar-wrap">
            <div class="avatar">
                <a href="#"><img
                        src="{{ getImage(getFilePath('userProfile') . '/' . @$item->user->image, getFileSize('userProfile')) }}"
                        alt="@lang('profile Image')"></a>
            </div>
        </div>
        <div class="timeline-single-post__content">
            <div class="timeline-single-post__content-top-wrapper">
                <div class="avatar-content">
                    <div class="avatar-name">
                        <h5> <a href="single-user.html">{{ __(@$item->user->fullname) }}</a></h5>
                    </div>
                    <div class="single-item-menu">
                        <button>
                            <i class="fas fa-ellipsis-h"></i>
                        </button>
                    </div>
                </div>
                <div class="timeline-single-post__post-content">
                    <div class="public-text">{{ __($item->text) }}</div>


                    <div class="post-thumbnail">
                        <a class="image-popup" href="assets/images/blog/2.jpg">
                            @foreach ($item->postFile as $media)
                                @if ($media->type == 'image')
                                    <img src="{{ getImage(getFilePath('PostMedia') . '/' . $media->file) }}"
                                        alt="@lang('post image')">
                                @elseif($media->type == 'video')
                                    <video width="640" height="360" controls>
                                        <source
                                            src="{{ getImage(getFilePath('PostMedia') . '/' . $media->file) }}"
                                            type="video/mp4">
                                    </video>
                                @elseif($media->type == 'audio')
                                    <audio controls>
                                        <source
                                            src="{{ getImage(getFilePath('PostMedia') . '/' . $media->file) }}"
                                            type="audio/mpeg">
                                    </audio>
                                @else

                                <div class="file-icon">
                                    @php
                                        $extension = pathinfo($media->file, PATHINFO_EXTENSION);
                                        $iconClass = '';

                                        switch ($extension) {
                                            case 'pdf':
                                                $iconClass = 'fas fa-file-pdf';
                                                break;
                                            case 'doc':
                                            case 'docx':
                                                $iconClass = 'fas fa-file-word';
                                                break;
                                            case 'xls':
                                            case 'xlsx':
                                                $iconClass = 'fas fa-file-excel';
                                                break;
                                            case 'ppt':
                                            case 'pptx':
                                                $iconClass = 'fas fa-file-powerpoint';
                                                break;
                                            case 'txt':
                                                $iconClass = 'fas fa-file-alt';
                                                break;
                                            case 'zip':
                                            case 'rar':
                                                $iconClass = 'fas fa-file-archive';
                                                break;
                                            case 'jpg':
                                            case 'jpeg':
                                            case 'png':
                                            case 'gif':
                                                $iconClass = 'fas fa-file-image';
                                                break;
                                            default:
                                                $iconClass = 'fas fa-file';
                                        }
                                    @endphp
                                    <p><i class="{{ $iconClass }}"></i></p>
                                </div>
                                @endif
                            @endforeach
                        </a>
                    </div>
                </div>

                <div class="timeline-single-post__bottom-control">
                    <div class="social-wrap">
                        <button>
                            <span class="icon likePost {{ $item->likedByUsers->contains(auth()->user()) ? 'clicked' : '' }}" data-post_id = "{{$item->id}}" >  <i class="{{ $item->likedByUsers->contains(auth()->user()) ? 'fas' : 'far' }} fa-thumbs-up"></i></span>
                            <span class="count likecount">{{__($item->likes_count)}}</span>
                        </button>
                        <button data-bs-toggle="modal" data-bs-target="#commentModal">
                            <span class="icon"><i class="far fa-comment"></i></span>
                            <span class="count">0</span>
                        </button>
                        <button data-bs-toggle="modal" data-bs-target="#shareModal">
                            <span class="icon"><i class="fas fa-share-alt"></i></span>
                        </button>
                    </div>
                    <div class="post-timeline">
                        <p>{{diffForHumans($item->created_at)}}</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endforeach
@endsection
@push('script')
    <script>

        function copyProfileLink() {

            var tempInput = document.createElement("input");
            tempInput.value = "{{ route('home') }}/user/profile-page/{{ $user->username }}";
            document.body.appendChild(tempInput);
            tempInput.select();
            document.execCommand("copy");
            document.body.removeChild(tempInput);
            Toast.fire({
                icon: 'success',
                title: 'Profile link copied to clipboard'
            });
        }


        $(document).ready(function () {

                $('.likePost').on('click', function () {
                var postId = $(this).data('post_id');
                var likeButton = $(this);
                var likeCount = likeButton.closest('button').find('.likecount');

                $.ajax({
                    type: 'get',
                    url: '{{ route("user.like.bye.post") }}',
                    data: {
                        post_id:postId,
                    },
                    success: function (data) {
                        if (data.success) {
                        likeButton.find('span.icon').toggleClass('clicked');
                        var icon = likeButton.find('i');
                        icon.toggleClass('fas');
                        icon.toggleClass('far');

                        // Update the like count
                        likeCount.text(data.likeCount);
                        }
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            });

        });
    </script>
@endpush


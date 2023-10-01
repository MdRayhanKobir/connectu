@extends($activeTemplate . 'layouts.master')
@section('content')
    <!-- Middle container area start -->
    <div class="timeline-wrapper-parent-container">
        <div class="timeline-wrapper-container">
            <!--======================= Poll Modal Start =======================-->
            <!-- Timeline top  start -->
            <form action="{{ route('user.post.store') }}" method="post" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="privacy" id="privacy" value="everyone">
                <div class="timeline-top-post-wrap timeline-mt-60">
                    <div class="timeline-top-post-wrap__header-post">
                        <div class="timeline-top-post-wrap__thumb">
                            <img src="{{ getImage(getFilePath('userProfile') . '/' . @$user->image, getFileSize('userProfile')) }}"
                                alt="@lang('User Image')">
                        </div>
                        <div class="timeline-top-post-wrap__textinput">
                            <!-- " -->
                            <textarea class="timeline-post-area" name="text" placeholder="@lang('What\'s on your mind?')"></textarea>
                        </div>
                    </div>

                    <div class="timeline-top-post-wrap__upload-icon-wrap">

                        <div class="upload-icon">
                            <div class="upload-item">
                                <span class="toltip">@lang('Image')</span>
                                <div class="upload-wrap">
                                    <label for="image"><i class="fas fa-image"></i></label>
                                    <input type="file" name="image" class="upload-input">
                                </div>
                            </div>
                            <div class="upload-item active">
                                <div class="upload-wrap">
                                    <span class="toltip">@lang('Video')</span>
                                    <label for="video"><i class="fas fa-play"></i></label>
                                    <input type="file" name="video" class="upload-input">
                                </div>
                            </div>
                            <div class="upload-item">
                                <span class="toltip">@lang('Music')</span>
                                <div class="upload-wrap">
                                    <label for="audio"><i class="fas fa-music"></i></label>
                                    <input type="file" name="audio" class="upload-input">
                                </div>
                            </div>
                            <div class="upload-item">
                                <span class="toltip">@lang('File')</span>
                                <div class="upload-wrap">
                                    <label for="file"><i class="fas fa-file"></i></label>
                                    <input type="file" name="file" class="upload-input">
                                </div>
                            </div>
                        </div>
                        <div class="post-count">
                            <span class="start-count timeline-top-post-start">@lang('0')</span><span>/</span><span
                                class="total-count">@lang('200')</span>
                        </div>

                    </div>

                    <div class="timeline-top-post-wrap__button-wrap">
                        <div class="button-left">
                            <div class="menu-wrapper">
                                <ul class="reply-menu">
                                    <li class="reply-menu__item">
                                        <a class="reply-menu__link replace-menu-item" href="javascript:void(0)">
                                            <span class="icon"><i class="fa-solid fa-earth-africa"></i></span>
                                            <span class="text">@lang('Privacy')</span>
                                        </a>
                                        <ul class="reply-menu submenu">
                                            <li class="reply-menu__item sub-menu-item active">
                                                <a class="reply-menu__link" href="javascript:void(0)"
                                                    onclick="setPrivacy('everyone')">
                                                    <span class="icon"><i class="fas fa-earth-africa"></i></span>
                                                    <span class="check-icon"><i class="fas fa-check"></i></span>
                                                    <span class="text" data-everyone="everyone">@lang('Everyone')</span>
                                                </a>
                                            </li>
                                            <li class="reply-menu__item sub-menu-item">
                                                <a class="reply-menu__link" href="javascript:void(0)"
                                                    onclick="setPrivacy('onlymyfollower')">
                                                    <span class="icon"><i class="fas fa-person"></i></span>
                                                    <span class="check-icon"><i class="fas fa-check"></i></span>
                                                    <span class="text"
                                                        data-onlymyfollower="onlymyfollower">@lang('Only My Followers')</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="button-right">
                            <button type="submit" class="btn btn--base btn--sm pill disable_enable"
                                disabled="disabled">@lang('Publish')</button>
                        </div>
                    </div>
                </div>
            </form>
            <!--======================= Timeline top ENd =======================-->
            <!-- -->

            <!--======================= Timeline Single Post Start =======================-->
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
                                        <h5> <a href="{{route('user.mypage',$item->user->username)}}">{{ __(@$item->user->fullname) }}</a></h5>
                                    </div>
                                    <div class="single-item-menu">
                                        <button>
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                        <ul class="post-top-menu">
                                            <li class="post-top-menu__item">
                                                <a class="post-top-menu__link" href="{{route('user.mypage',$item->user->username)}}">
                                                    <span class="icon"><i class="fas fa-user"></i></span>
                                                    <span class="text">{{__($item->user->username)}}</span>
                                                </a>
                                            </li>
                                            @if(auth()->user()->id == $item->user->id )
                                            <li class="post-top-menu__item">
                                                <button class="post-top-menu__link editpostBtn" data-id={{$item->id}} data-text="{{$item->text}}">
                                                    <span class="icon"><i class="fas fa-edit"></i></span>
                                                    <span class="text">@lang('Edit Post')</span>
                                                </button>
                                            </li>


                                            <li class="post-top-menu__item">
                                                <a class="post-top-menu__link" href="{{route('user.post.move.archive',$item->id)}}">
                                                    <span class="icon"><i class="fas fa-trash"></i></span>
                                                    <span class="text">@lang('Move to achive')</span>
                                                </a>
                                            </li>
                                            @endif

                                        </ul>
                                    </div>
                                </div>
                                <div class="timeline-single-post__post-content">
                                    <div class="public-text">{{ __($item->text) }}</div>


                                    <div class="post-thumbnail">
                                            @foreach ($item->postFile as $media)
                                                @if ($media->type == 'image')
                                                <a href="{{ getImage(getFilePath('PostMedia') . '/' . $media->file) }}">
                                                    <img src="{{ getImage(getFilePath('PostMedia') . '/' . $media->file) }}"
                                                        alt="@lang('post image')">
                                                </a>
                                                @elseif($media->type == 'video')
                                                    <video width="640" height="360" controls>
                                                        <source
                                                            src="{{ getImage(getFilePath('PostMedia') . '/' . $media->file) }}"
                                                            type="video/mp4">
                                                    </video>
                                                @elseif($media->type == 'audio')
                                                    <audio controls>
                                                        <source src="{{ getImage(getFilePath('PostMedia') . '/' . $media->file) }}"
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
                                                    <a href="">
                                                        <p><i class="{{ $iconClass }}"></i></p>
                                                    </a>
                                                </div>
                                                @endif
                                        
                                            @endforeach
                                    </div>
                                </div>

                                <div class="timeline-single-post__bottom-control">
                                    <div class="social-wrap">
                                        <button>
                                            <span class="icon likePost {{ $item->likedByUsers->contains(auth()->user()) ? 'clicked' : '' }}" data-post_id = "{{$item->id}}" >  <i class="{{ $item->likedByUsers->contains(auth()->user()) ? 'fas' : 'far' }} fa-thumbs-up"></i></span>
                                            <span class="count likecount">{{__($item->likes_count)}}</span>
                                        </button>
                                        <a href="{{route('user.post.details',$item->id)}}">
                                            <span class="icon"><i class="far fa-comment"></i></span>
                                            <span class="count">{{$item->replys_count}}</span>
                                        </a>
                                        <button class="shareBtn" data-id ="{{$item->id}}">
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
            <!--======================= Timeline Single Post End =======================-->



            <!--============== Edit Post Modal Modal Start ===============-->
            <!-- Modal -->
            <div class="modal fade" id="editPostModal" tabindex="-1" aria-labelledby="editPostModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editPostModalLabel">@lang('Edit Post')</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>

                        <form action="{{route('user.post.update')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="id">
                            <div class="modal-body">
                                <div class="timeline-top-post-wrap modal-wrapper">
                                    <div class="timeline-top-post-wrap__header-post">

                                        <div class="timeline-top-post-wrap__textinput">
                                            <!-- " -->
                                            <textarea class="editpost-modal-popup-textarea" name="text" placeholder="@lang('Enter Your post')"></textarea>
                                        </div>
                                    </div>

                                    <div class="timeline-top-post-wrap__upload-icon-wrap justify-content-end">

                                        <div class="post-count">
                                            <span class="start-count editpost-modal-count-start">@lang('0')</span><span>/</span><span
                                                class="total-count">@lang('200')</span>
                                        </div>
                                    </div>

                                    <div class="timeline-top-post-wrap__button-wrap justify-content-end">
                                        <div class="button-right">
                                            <button type="submit" class="btn btn--base btn--sm pill">@lang('Save Changes')</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!--============== Edit Post Modal Modal End ===============-->

            <!--==============Share Modal Modal Start ===============-->
            <!-- Modal -->
            <div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="sharetModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="sharetModalLabel">@lang('Share Post')</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="timeline-top-post-wrap modal-wrapper">
                                <div class="timeline-top-post-wrap__header-post mb-3">
                                    <ul class="social-list">
                                        <li class="social-list__item">
                                            <a href="#" class="social-list__link share-link" data-social="facebook"><i class="fab fa-facebook-f"></i></a>
                                        </li>
                                        <li class="social-list__item">
                                            <a href="#" class="social-list__link share-link" data-social="twitter"><i class="fab fa-twitter"></i></a>
                                        </li>
                                        <li class="social-list__item">
                                            <a href="#" class="social-list__link share-link" data-social="linkedin"><i class="fab fa-linkedin-in"></i></a>
                                        </li>

                                    </ul>
                                </div>

                                <div class="timeline-top-post-wrap__upload-icon-wrap justify-content-end">
                                    <input class="form--control shareLinkCopy" type="text" name="share_link" value="{{route('home')}}/user/posts/details/" readonly>
                                </div>

                                <div class="timeline-top-post-wrap__button-wrap justify-content-end">
                                    <div class="button-right">
                                        <button class="btn btn--base btn--sm pill" id="copyPostShareLink" onclick="copyPostShareLink()">@lang('Copy Link')</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--==============Share Modal Modal End ===============-->
        </div>
    </div>
    <!-- Middle container area end -->
@endsection

@push('script')
<script>

    function copyPostShareLink() {
        var tempInput = $('.shareLinkCopy');
        tempInput.select();
        document.execCommand("copy");
        Toast.fire({
            icon: 'success',
            title: 'Post share link copied to clipboard'
        });
    }


$(document).ready(function () {

    function setPrivacy(option) {
        document.getElementById('privacy').value = option;
    }

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


    $('.shareBtn').on('click', function() {
        var modal = $('#shareModal');
        var postId = $(this).data('id');
        var shareLink = "{{ route('home') }}/user/posts/details/" + postId;
        modal.find('input[name=share_link]').val(shareLink);

        // Update the href attribute of the share links
        $('.share-link[data-social="facebook"]').attr('href', 'https://www.facebook.com/sharer/sharer.php?u=' + shareLink);
        $('.share-link[data-social="twitter"]').attr('href', 'https://twitter.com/intent/tweet?url=' + shareLink);
        $('.share-link[data-social="linkedin"]').attr('href', 'https://www.linkedin.com/shareArticle?url=' + shareLink);

        modal.modal('show');
    });


    $('.editpostBtn').on('click', function() {
        var modal = $('#editPostModal');
        var postId = $(this).data('id');
        var text = $(this).data('text');
        modal.find('input[name=id]').val(postId);
        modal.find('textarea[name=text]').val(text);
        modal.modal('show');
    });

});
</script>
@endpush

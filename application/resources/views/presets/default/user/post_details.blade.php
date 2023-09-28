@php
$replies = \App\Models\Comment::orderBy('created_at', 'desc')->with(['post', 'user'])->where('post_id',$post->id)->get();
if (!function_exists('post_replies')) {
    function post_replies($replies, $parent_id = null, $level = 0) {

        foreach ($replies as $reply) {

            $postId =  $reply->post->id;
            if ($reply->parent_id == $parent_id) {
                // display the reply
                $reply_form_id = "reply-form-$reply->id";
                echo "<div style='margin-left: 20px;'>";
                echo '<li class="comment-list__item d-flex flex-wrap">
                    <div class="comment-list__thumb">
                        <img src="' . getImage(getFilePath('userProfile') . '/' . $reply->user->image) . '" alt="">
                    </div>

                    <div class="comment-list__content">
                        <h4 class="comment-list__name">' .$reply->user->fullname. '</h4>
                        <span class="comment-list__time"><span class="comment-list__time-icon"><i class="fas fa-clock"></i></span>'.showDateTime($reply->created_at).'</span>';

                        if($reply->user_id == auth()->user()->id) {
                            echo '<a class="ms-2" href="'.route('user.post.delete.reply', $reply->id).'"><i class="text-danger fas fa-trash"></i></a>';
                            echo '<button class="ms-2 addUpdateReply" data-id="' . $reply->id . '" data-reply="' . $reply->reply . '"><i class="text--base fas fa-edit"></i></button>';
                        }
                        echo '
                        <p class="comment-list__desc">'.$reply->reply.'</p>
                        <div class="comment-list__reply">
                            <p class="comment-list__reply-text" onclick="showReplyForm(\''.$reply_form_id.'\')"> '.__('Reply').'</p>
                        </div>
                    </div>
                </li>';

                    // display the reply form
                echo "<div id='$reply_form_id' style='display: none;'>";
                echo "<form action='" . route('user.post.reply') . "' method='post'>";
                echo csrf_field();
                echo "<input type='hidden' name='parent_id' value='$reply->id'>";
                echo "<input type='hidden' name='post_id' value='$postId'>";
                echo "<div class='form-group profile mb-2'>";
                echo "<div class='single-input'>";
                echo "<textarea class='form--control' id='reply' name='reply' rows='5' placeholder='" . __('Write Something') . "'></textarea>";
                echo "<i class='fa-regular fa-message'></i>";
                echo "</div></div>";
                echo "<div class='buttorn_wrapper text-end'>";
                echo "<button type='submit' class='btn btn--base btn--sm pill'><span class='btn_title'>" . __('Reply') . "</span></button>";
                echo "</div>";
                echo "</form></div>";

                // recursively display child replies
                post_replies($replies, $reply->id, $level+1);

                echo "</div>";
            }
        }
    }
}
@endphp

@extends($activeTemplate . 'layouts.master')
@section('content')
    <!-- Middle container area start -->
    <div class="timeline-wrapper-parent-container py-60">
        <div class="timeline-wrapper-container">
            <!--======================= Timeline Single Post Start =======================-->
            <div class="timeline-single-post-wrap">
                <div class="timeline-single-post">
                    <div class="timeline-single-post__avatar-wrap">
                        <div class="avatar">
                            <a href="#"><img src="{{ getImage(getFilePath('userProfile') . '/' . @$post->user->image, getFileSize('userProfile')) }}" alt="@lang('profile Image')"></a>
                        </div>
                    </div>
                    <div class="timeline-single-post__content">
                        <div class="timeline-single-post__content-top-wrapper">
                            <div class="avatar-content">
                                <div class="avatar-name">
                                    <h5> <a href="single-user.html">{{ __(@$post->user->fullname) }}</a></h5>
                                </div>
                                <div class="single-item-menu">
                                    <button>
                                        <i class="fas fa-ellipsis-h"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="timeline-single-post__post-content">
                                <div class="public-text">{{ __($post->text) }}</div>


                                <div class="post-thumbnail">
                                    <a class="image-popup" href="assets/images/blog/2.jpg">
                                        @foreach ($post->postFile as $media)
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
                                        <span
                                            class="icon likePost {{ $post->likedByUsers->contains(auth()->user()) ? 'clicked' : '' }}"
                                            data-post_id="{{ $post->id }}"> <i
                                                class="{{ $post->likedByUsers->contains(auth()->user()) ? 'fas' : 'far' }} fa-thumbs-up"></i></span>
                                        <span class="count likecount">{{ __($post->likes_count) }}</span>
                                    </button>
                                    <a href="javascript:void(0)">
                                        <span class="icon"><i class="far fa-comment"></i></span>
                                        <span class="count">{{$post->replys_count}}</span>
                                    </a>
                                    <button data-bs-toggle="modal" data-bs-target="#shareModal">
                                        <span class="icon"><i class="fas fa-share-alt"></i></span>
                                    </button>
                                </div>
                                <div class="post-timeline">
                                    <p>{{ diffForHumans($post->created_at) }}</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--======================= Timeline Single Post End =======================-->
            <div class="dashboard_box p-3 mb-3">
                <form action="{{route('user.post.reply')}}" method="post">
                    @csrf
                    <input type="hidden" name="post_id" value="{{ $post->id }}">
                    <div class="form-group profile mb-25">
                        <div class="single-input">
                            <textarea id="reply" class="form--control" name="reply" rows="5" placeholder="@lang('Reply to this post')" required></textarea>
                            <i class="fa-regular fa-message"></i>
                        </div>
                    </div>
                    <div class="buttorn_wrapper text-end">
                        <button type="submit" class="btn btn--base pill btn--sm style_1 mt-2"> <span
                                class="btn_title">@lang('Comment')</span></button>
                    </div>
                </form>
            </div>

            <div class="dashboard_box p-3 mb-3">
                <div class="col-lg-12 pt-5">
                    <h5 class="details-subtitle mb-4"> @lang('Replies')</h5>
                    <ul class="comment-list">
                        @if ($post->comments->count() > 0)
                        @php post_replies($replies) @endphp
                        @else
                        <p>@lang('No replies yet').</p>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Middle container area end -->

{{-- Update METHOD MODAL --}}
<div id="updateReply" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"> @lang('Update Comment')</h5>
                <button type="button" class="close btn btn--sm btn--danger pill outline" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </button>
            </div>
            <form action="{{route('user.post.update.reply')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form--label">@lang('Comment'):</label>
                        <div class="input-group">
                            <textarea type="text" class="form--control"
                            name="reply" placeholder="@lang('Reply')" required ></textarea>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn--base btn--sm pill">@lang('Update')</button>
                </div>
            </form>
        </div>
    </div>
</div>



@endsection

@push('script')
    <script>

    function showReplyForm(replyFormId) {
            $('#' + replyFormId).slideToggle('slow');
        }

        $('.addUpdateReply').on('click', function() {
            var modal = $('#updateReply');
            modal.find('input[name=id]').val($(this).data('id'));
            modal.find('textarea[name=reply]').val($(this).data('reply'));
            modal.modal('show');
            });


        $(document).ready(function() {

            function setPrivacy(option) {
                document.getElementById('privacy').value = option;
            }

            $('.likePost').on('click', function() {
                var postId = $(this).data('post_id');
                var likeButton = $(this);
                var likeCount = likeButton.closest('button').find('.likecount');

                $.ajax({
                    type: 'get',
                    url: '{{ route('user.like.bye.post') }}',
                    data: {
                        post_id: postId,
                    },
                    success: function(data) {
                        if (data.success) {
                            likeButton.find('span.icon').toggleClass('clicked');
                            var icon = likeButton.find('i');
                            icon.toggleClass('fas');
                            icon.toggleClass('far');

                            // Update the like count
                            likeCount.text(data.likeCount);
                        }
                    },
                    error: function(data) {
                        console.log('Error:', data);
                    }
                });
            });

        });

    </script>
@endpush

@extends($activeTemplate.'layouts.frontend')
@section('content')
<section>
  <!-- Middle container area start -->
  <div class="timeline-wrapper-parent-container">
    <div class="timeline-wrapper-container">
        <!--======================= Poll Modal Start =======================-->
        <!-- Timeline top  start -->
        <form action="">
            <div class="timeline-top-post-wrap timeline-mt-60">
                <div class="timeline-top-post-wrap__header-post">
                    <div class="timeline-top-post-wrap__thumb">
                        <img src="assets/images/avatar/obaydul.png" alt="">
                    </div>
                    <div class="timeline-top-post-wrap__textinput">
                        <!-- " -->
                        <textarea class="timeline-post-area"
                            placeholder="What is Happening ?!"></textarea>
                    </div>
                </div>

                <div class="timeline-top-post-wrap__upload-icon-wrap">

                    <div class="upload-icon">
                        <div class="upload-item">
                            <span class="toltip">Media</span>
                            <div class="upload-wrap">
                                <label for="file_upload"><i class="fa-regular fa-image"></i></label>
                                <input id="file_upload" type="file" class="upload-input">
                            </div>
                        </div>
                        <div class="upload-item active">
                            <div class="upload-wrap">
                                <span class="toltip">Video</span>
                                <label for="file_upload"><i class="fa-solid fa-play"></i></label>
                                <input id="file_upload" type="file" class="upload-input">
                            </div>
                        </div>
                        <div class="upload-item">
                            <span class="toltip">Music</span>
                            <div class="upload-wrap">
                                <label for="file_upload"><i class="fa-solid fa-music"></i></label>
                                <input id="file_upload" type="file" class="upload-input">
                            </div>
                        </div>
                        <div class="upload-item">
                            <span class="toltip">File</span>
                            <div class="upload-wrap">
                                <label for="file_upload"><i class="fa-solid fa-file"></i></label>
                                <input id="file_upload" type="file" class="upload-input">
                            </div>
                        </div>
                        <div class="upload-item" data-bs-toggle="modal" data-bs-target="#pollModal">
                            <span class="toltip">Poll</span>
                            <div class="upload-wrap">
                                <label><i class="fa-solid fa-square-poll-vertical"></i></label>
                            </div>
                        </div>
                    </div>
                    <div class="post-count">
                        <span class="start-count timeline-top-post-start">0</span><span>/</span><span
                            class="total-count">200</span>
                    </div>

                </div>

                <div class="timeline-top-post-wrap__button-wrap">
                    <div class="button-left">
                        <div class="menu-wrapper">
                            <ul class="reply-menu">
                                <li class="reply-menu__item">
                                    <a class="reply-menu__link replace-menu-item"
                                        href="javascript:void(0);">
                                        <span class="icon"><i
                                                class="fa-solid fa-earth-africa"></i></span>
                                        <span class="text"> Everyone can reply</span>
                                    </a>
                                    <ul class="reply-menu submenu">
                                        <li class="reply-menu__item sub-menu-item active">
                                            <a class="reply-menu__link" href="javascript:void(0);">
                                                <span class="icon"><i
                                                        class="fa-solid fa-earth-africa"></i></span>
                                                <span class="check-icon"><i
                                                        class="fa-solid fa-check"></i></span>
                                                <span class="text">Everyone can reply</span>
                                            </a>
                                        </li>
                                        <li class="reply-menu__item sub-menu-item">
                                            <a class="reply-menu__link" href="javascript:void(0);">
                                                <span class="icon"><i
                                                        class="fa-solid fa-person"></i></span>
                                                <span class="check-icon"><i
                                                        class="fa-solid fa-check"></i></span>
                                                <span class="text">Only mentioned people </span>
                                            </a>
                                        </li>
                                        <li class="reply-menu__item sub-menu-item">
                                            <a class="reply-menu__link" href="javascript:void(0);">
                                                <span class="icon"><i
                                                        class="fa-solid fa-users"></i></span>
                                                <span class="check-icon"><i
                                                        class="fa-solid fa-check"></i></span>
                                                <span class="text">Only my follower</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div class="button-right">
                        <button class="btn btn--base btn--sm pill disable_enable"
                            disabled="disabled">Publish</button>
                    </div>
                </div>


            </div>
        </form>
        <!--======================= Timeline top ENd =======================-->
        <!-- -->


        <!--======= Poll Modal Start =======-->
        <div class="modal fade" id="pollModal" tabindex="-1" aria-labelledby="pollModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="pollModalLabel">Create a New Poll</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="">
                            <div class="timeline-top-post-wrap__header-post">
                                <div class="timeline-top-post-wrap__thumb">
                                    <img src="assets/images/avatar/obaydul.png" alt="">
                                </div>
                                <div class="timeline-top-post-wrap__textinput">
                                    <textarea placeholder="Enter your question here" name=""></textarea>
                                </div>
                            </div>

                            <div class="row gy-md-4 gy-3">
                                <div class="poll-wrapper">
                                    <div class="poll-item">
                                        <input type="text" class="form--control" placeholder="Option">
                                    </div>
                                    <div class="poll-item">
                                        <input type="text" class="form--control" placeholder="Option">
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn--secondary  pill"
                            data-bs-dismiss="modal">Cancale Poll</button>
                        <button type="button" id="add-mote-poll" class="btn btn--base pill">Add More
                            Poll</button>
                    </div>
                </div>
            </div>
        </div>
        <!--======= Poll Modal ENd =======-->

        <!--======================= Timeline Single Post Start =======================-->
        <div class="timeline-single-post-wrap">
            <div class="timeline-single-post">
                <div class="timeline-single-post__avatar-wrap">
                    <div class="avatar">
                        <a href=""><img src="assets/images/avatar/obaydul.png" alt=""></a>
                    </div>
                </div>
                <div class="timeline-single-post__content">
                    <div class="timeline-single-post__content-top-wrapper">
                        <div class="avatar-content">
                            <div class="avatar-name">
                                <h5> <a href="single-user.html">Md. Obaydulla<i
                                            class="fa-solid fa-circle-check"></i></a></h5>
                            </div>
                            <div class="single-item-menu">
                                <button>
                                    <i class="fa-solid fa-ellipsis"></i>
                                </button>
                            </div>
                        </div>
                        <div class="timeline-single-post__post-content">
                            <div class="public-text">Lorem ipsum dolor sit amet consectetur, adipisicing
                                elit. Quo omnis non nam reiciendis temporibus consectetur neque corporis
                                mollitia totam libero.</div>
                            <div class="post-thumbnail">
                                <a class="image-popup" href="assets/images/blog/2.jpg">
                                    <img src="assets/images/blog/2.jpg" alt="">
                                </a>
                            </div>
                        </div>

                        <div class="timeline-single-post__bottom-control">
                            <div class="social-wrap">
                                <button>
                                    <span class="icon"><i class="fa-solid fa-thumbs-up"></i></span>
                                    <span class="count like-count">0</span>
                                </button>
                                <button data-bs-toggle="modal" data-bs-target="#commentModal">
                                    <span class="icon"><i class="fa-solid fa-comment-dots"></i></span>
                                    <span class="count">0</span>
                                </button>
                                <button data-bs-toggle="modal" data-bs-target="#shareModal">
                                    <span class="icon"><i class="fa-solid fa-share-nodes"></i></span>
                                    <span class="count">0</span>
                                </button>
                            </div>
                            <div class="post-timeline">
                                <p>4 Days ago</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--======================= Timeline Single Post End =======================-->

        <!--======================= Timeline Single Post Start =======================-->
        <div class="timeline-single-post-wrap">
            <div class="timeline-single-post">
                <div class="timeline-single-post__avatar-wrap">
                    <div class="avatar">
                        <a href=""><img src="assets/images/avatar/obaydul.png" alt=""></a>
                    </div>
                </div>
                <div class="timeline-single-post__content">
                    <div class="timeline-single-post__content-top-wrapper">
                        <div class="avatar-content">
                            <div class="avatar-name">
                                <h5> <a href="single-user.html">Md. Obaydulla</a></h5>
                            </div>
                            <div class="single-item-menu">
                                <button>
                                    <i class="fa-solid fa-ellipsis"></i>
                                </button>
                            </div>
                        </div>
                        <div class="timeline-single-post__post-content">
                            <div class="public-text">Hello, Hor are you ?.</div>
                        </div>

                        <div class="timeline-single-post__bottom-control">
                            <div class="social-wrap">
                                <button>
                                    <span class="icon"><i class="fa-solid fa-thumbs-up"></i></span>
                                    <span class="count like-count">0</span>
                                </button>
                                <button data-bs-toggle="modal" data-bs-target="#commentModal">
                                    <span class="icon"><i class="fa-solid fa-comment-dots"></i></span>
                                    <span class="count">0</span>
                                </button>
                                <button data-bs-toggle="modal" data-bs-target="#shareModal">
                                    <span class="icon"><i class="fa-solid fa-share-nodes"></i></span>
                                    <span class="count">0</span>
                                </button>
                            </div>
                            <div class="post-timeline">
                                <p>4 Days ago</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--======================= Timeline Single Post End =======================-->

        <!--======================= Timeline Single Post Start =======================-->
        <div class="timeline-single-post-wrap">
            <div class="timeline-single-post">
                <div class="timeline-single-post__avatar-wrap">
                    <div class="avatar">
                        <a href=""><img src="assets/images/avatar/obaydul.png" alt=""></a>
                    </div>
                </div>
                <div class="timeline-single-post__content">
                    <div class="timeline-single-post__content-top-wrapper">
                        <div class="avatar-content">
                            <div class="avatar-name">
                                <h5> <a href="single-user.html">Md. Obaydulla</a></h5>
                            </div>
                            <div class="single-item-menu">
                                <button>
                                    <i class="fa-solid fa-ellipsis"></i>
                                </button>
                            </div>
                        </div>
                        <div class="timeline-single-post__post-content">
                            <div class="public-text">Lorem ipsum dolor sit amet consectetur, adipisicing
                                elit. Quo omnis non nam reiciendis temporibus consectetur neque corporis
                                mollitia totam libero.</div>
                            <div class="post-thumbnail">
                                <a class="image-popup" href="assets/images/blog/mypost.jpg">
                                    <img src="assets/images/blog/mypost.jpg" alt="">
                                </a>
                            </div>
                        </div>

                        <div class="timeline-single-post__bottom-control">
                            <div class="social-wrap">
                                <button>
                                    <span class="icon"><i class="fa-solid fa-thumbs-up"></i></span>
                                    <span class="count like-count">0</span>
                                </button>
                                <button data-bs-toggle="modal" data-bs-target="#commentModal">
                                    <span class="icon"><i class="fa-solid fa-comment-dots"></i></span>
                                    <span class="count">0</span>
                                </button>
                                <button data-bs-toggle="modal" data-bs-target="#shareModal">
                                    <span class="icon"><i class="fa-solid fa-share-nodes"></i></span>
                                    <span class="count">0</span>
                                </button>
                            </div>
                            <div class="post-timeline">
                                <p>4 Days ago</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--======================= Timeline Single Post End =======================-->

        <!--============== Comment Modal Start ===============-->
        <!-- Modal -->
        <div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="commentModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="commentModalLabel">Post Replay</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="">
                            <div class="timeline-top-post-wrap  modal-wrapper">
                                <div class="timeline-top-post-wrap__header-post">
                                    <div class="timeline-top-post-wrap__thumb">
                                        <img src="assets/images/avatar/obaydul.png" alt="">
                                    </div>
                                    <div class="timeline-top-post-wrap__textinput">
                                        <!-- " -->
                                        <textarea class="comment-modal-popup-textarea"
                                            placeholder="Enter Your Replay.."></textarea>
                                    </div>
                                </div>

                                <div class="timeline-top-post-wrap__upload-icon-wrap">
                                    <div class="upload-icon">
                                        <div class="upload-item">
                                            <span class="toltip">Media</span>
                                            <div class="upload-wrap">
                                                <label for="file_upload"><i
                                                        class="fa-regular fa-image"></i></label>
                                                <input id="file_upload" type="file"
                                                    class="upload-input">
                                            </div>
                                        </div>
                                        <div class="upload-item active">
                                            <div class="upload-wrap">
                                                <span class="toltip">Video</span>
                                                <label for="file_upload"><i
                                                        class="fa-solid fa-play"></i></label>
                                                <input id="file_upload" type="file"
                                                    class="upload-input">
                                            </div>
                                        </div>
                                        <div class="upload-item">
                                            <span class="toltip">Music</span>
                                            <div class="upload-wrap">
                                                <label for="file_upload"><i
                                                        class="fa-solid fa-music"></i></label>
                                                <input id="file_upload" type="file"
                                                    class="upload-input">
                                            </div>
                                        </div>
                                        <div class="upload-item">
                                            <span class="toltip">File</span>
                                            <div class="upload-wrap">
                                                <label for="file_upload"><i
                                                        class="fa-solid fa-file"></i></label>
                                                <input id="file_upload" type="file"
                                                    class="upload-input">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="post-count">
                                        <span
                                            class="start-count cmt-modal-count-start">0</span><span>/</span><span
                                            class="total-count">200</span>
                                    </div>
                                </div>

                                <div class="timeline-top-post-wrap__button-wrap justify-content-end">
                                    <div class="button-right">
                                        <button class="btn btn--base btn--sm pill comment-modal-btn"
                                            disabled="disabled">Publish</button>
                                    </div>
                                </div>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--============== Comment Modal End ===============-->

        <!--============== Edit Post Modal Modal Start ===============-->
        <!-- Modal -->
        <div class="modal fade" id="editPostModal" tabindex="-1" aria-labelledby="editPostModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editPostModalLabel">Edit Post</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="timeline-top-post-wrap modal-wrapper">
                            <div class="timeline-top-post-wrap__header-post">
                                <div class="timeline-top-post-wrap__thumb">
                                    <img src="assets/images/avatar/obaydul.png" alt="">
                                </div>
                                <div class="timeline-top-post-wrap__textinput">
                                    <!-- " -->
                                    <textarea class="editpost-modal-popup-textarea"
                                        placeholder="Enter Your Replay..">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quo omnis non nam reiciendis temporibus consectetur neque corporis mollitia totam libero.</textarea>
                                </div>
                            </div>

                            <div class="timeline-top-post-wrap__upload-icon-wrap justify-content-end">

                                <div class="post-count">
                                    <span
                                        class="start-count editpost-modal-count-start">0</span><span>/</span><span
                                        class="total-count">200</span>
                                </div>
                            </div>

                            <div class="timeline-top-post-wrap__button-wrap justify-content-end">
                                <div class="button-right">
                                    <button class="btn btn--base btn--sm pill">Save Changes</button>
                                </div>
                            </div>


                        </div>
                    </div>
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
                        <h5 class="modal-title" id="sharetModalLabel">Share Post</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="">
                            <div class="timeline-top-post-wrap modal-wrapper">
                                <div class="timeline-top-post-wrap__header-post mb-3">
                                    <ul class="social-list">
                                        <li class="social-list__item"><a href="https://www.facebook.com"
                                                class="social-list__link"><i
                                                    class="fab fa-facebook-f"></i></a> </li>
                                        <li class="social-list__item"><a href="https://www.twitter.com"
                                                class="social-list__link"> <i
                                                    class="fab fa-twitter"></i></a></li>
                                        <li class="social-list__item"><a href="https://www.linkedin.com"
                                                class="social-list__link"> <i
                                                    class="fab fa-linkedin-in"></i></a></li>
                                        <li class="social-list__item"><a href="https://www.whatsapp.com"
                                                class="social-list__link"> <i
                                                    class="fa-brands fa-whatsapp"></i></a></li>
                                        <li class="social-list__item"><a
                                                href="https://www.pinterest.com"
                                                class="social-list__link"> <i
                                                    class="fab fa-instagram"></i></a></li>
                                        <li class="social-list__item"><a href="https://www.reddit.com"
                                                class="social-list__link"> <i
                                                    class="fa-brands fa-reddit-alien"></i></a></li>
                                        <li class="social-list__item"><a href="https://telegram.org"
                                                class="social-list__link"> <i
                                                    class="fa-brands fa-telegram"></i></a></li>
                                    </ul>
                                </div>

                                <div
                                    class="timeline-top-post-wrap__upload-icon-wrap justify-content-end">
                                    <input class="form--control" type="text"
                                        value='https://www.colibrism.ru/thread/39183'>
                                </div>

                                <div class="timeline-top-post-wrap__button-wrap justify-content-end">
                                    <div class="button-right">
                                        <button class="btn btn--base btn--sm pill">Copy Link</button>
                                    </div>
                                </div>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--==============Share Modal Modal End ===============-->

    </div>
</div>
<!-- Middle container area end -->
</section>

@if($sections->secs != null)
@foreach(json_decode($sections->secs) as $sec)
@include($activeTemplate.'sections.'.$sec)
@endforeach
@endif
@endsection

@push('style')
<style>
    p {
        margin-bottom: 0;
        color: #444
    }

    .document-wrapper {
        background-color: #fff;
        box-shadow: 0 3px 35px rgba(0, 0, 0, .1);
        border-radius: 7px;
        overflow: hidden;

    }

    div[class*='col']:nth-child(odd) .document-item {
        border-right: 1px solid rgba(0, 0, 0, .1)
    }

    div[class*='col-lg-12']:nth-child(odd) .document-item {
        border-right: 0;
    }

    div[class*='col']:nth-child(1) .document-item {
        border-top: 0;
    }

    div[class*='col']:nth-child(2) .document-item {
        border-top: 0;
    }

    .dark-mode {
        background-color: #1A202C;
    }

    .dark-mode p,
    .dark-mode .share-links li a {
        color: rgba(255, 255, 255, 0.8);
    }

    .dark-mode .document-wrapper {
        box-shadow: 0 3px 25px rgba(255, 255, 255, 0.03);
    }

    .dark-mode .document-item {
        background-color: #2D3748;
        color: rgba(255, 255, 255, 0.8);
        border-color: rgba(255, 255, 255, 0.1) !important;
    }

    .dark-mode .document-item__icon,
    .dark-mode .document-item__content .title a {
        color: #fff;
    }

    .document-item {
        background-color: #fff;
        padding: 45px 35px;
        border-top: 1px solid rgba(0, 0, 0, .1);
        height: 100%;
    }

    .document-item__icon {
        font-size: 32px;
        width: 35px;
        line-height: 1px;
    }

    .document-item__content {
        width: calc(100% - 35px);
        padding-left: 15px;
    }

    .document-item__content .title {
        margin-bottom: 13px;
    }

    .document-item__content .title a {
        color: #111;
        display: inline-block;
    }

    .document-footer ul {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .share-links li a {
        color: #444
    }

    .share-links li:not(:last-child) {
        padding-right: 25px;
    }

    .logo img {
        max-width: 220px;
    }
</style>
@endpush

 @php
    $hashtags = App\Models\Hashtag::latest()->inRandomOrder()->take(12)->get();
    $users = App\Models\User::active()
        ->whereNotIn('id', auth()->user()->following()->pluck('following_id'))
        ->where('id', '!=', auth()->user()->id)
        ->latest()
        ->limit(5)
        ->get();

 @endphp
 <!-- Right Sidebar area end -->
 <div class="right-sidebar-parent-wrapper">
    <div class="right-sidebar-wrapper">
        <div class="right-sidebar-head">
            <form action="#" autocomplete="off">
                <div class="search-box w-100">
                    <input type="text" class="form--control" placeholder="Search For People.">
                    <button type="submit" class="search-box__button"><i
                            class="fas fa-search"></i></button>
                </div>
            </form>
        </div>
          <!-- User start  -->
          <div class="right-sidebar-body">
            <h4 class="title">@lang('WHO TO FOLLOW')</h4>
            <div class="sidebar-inner-wrap border-botm">
                <div class="sidebar-user-wrap">
                   @foreach($users as $user)
                   <div class="sidebar-user-wrap__item">
                    <div class="sidebar-user-wrap__thumb">
                        <a href="">
                            <img src="{{ getImage(getFilePath('userProfile') . '/' . @$user->image, getFileSize('userProfile')) }}" alt="@lang('user profile')">
                        </a>
                    </div>
                    <div class="sidebar-user-wrap__content">
                        <h5 class="sidebar-user-wrap__content-show-auth-info"> <a
                                href="single-user.html">{{__($user->fullname)}}<i
                                    class="fa-solid fa-circle-check"></i></a></h5>
                        <p> <span> {{__($user->followers_count)}}</span>@lang('followers')</p>
                    </div>

                    <!-- ======== Right Sidebar Hover Markup start ======== -->
                    <div class="sidebar-user-hover">
                        <div class="sidebar-user-hover__thumb-wrap">
                            <img class="cover-photo" src="{{ getImage(getFilePath('userCoverImage') . '/' . @$user->cover_image, getFileSize('userCoverImage')) }}"  alt="@lang('Cover Image')">
                            <div class="sidebar-user-wrap__thumb">
                                <img src="{{ getImage(getFilePath('userProfile') . '/' . @$user->image, getFileSize('userProfile')) }}"  alt="@lang('user profile')">
                            </div>
                        </div>
                        <div class="sidebar-user-hover__content">
                            <div class="sidebar-user-wrap__content">
                                <div class="top">
                                    <h5> <a href="">
                                           {{__($user->fullname)}}<i class="fa-solid fa-circle-check"></i>
                                        </a>
                                        <span>@ {{__($user->username)}}</span>
                                    </h5>
                                </div>
                                <div class="followers">
                                    <a href="javascript:void(0)" >{{__($user->following_count)}} @lang('Following')</a>
                                    <a href="javascript:void(0)">{{__($user->followers_count)}} @lang('followers')</a>
                                </div>
                                <div class="bottom">
                                    <a href="{{ route('user.follow', $user->id) }}" class="btn btn--base btn--sm pill w-100">@lang('Follow')</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ======== Right Sidebar Hover Markup end ======== -->

                </div>
                   @endforeach
                </div>
                <div class="sidebar-inner-wrap__bottom">
                    <h6><a href="{{route('user.suggested')}}">@lang('Show More')</a></h6>
                </div>
            </div>
          </div>

        <!-- Tags start  -->
        <div class="right-sidebar-body border-botm">
            <h4 class="title">@lang('HOT TOPIC\'S FOR YOU')</h4>
            <div class="sidebar-inner-wrap">
                <div class="sidebar-tags">
                    @foreach($hashtags as $tag)
                        <div class="sidebar-tags__item">
                            <a href="{{route('user.post.fetch.hashtag',$tag->tag)}}"><i class="fas fa-hashtag"></i>{{__($tag->tag)}}</a>
                        </div>
                    @endforeach
                </div>
                <div class="sidebar-inner-wrap__bottom">
                    <h6><a href="{{route('user.trending')}}">@lang('Show More')</a></h6>
                </div>
            </div>
        </div>
        <!-- Tags End  -->

        <!-- Tags start  -->
        <div class="right-sidebar-body">
            <div class="sidebar-inner-wrap">
                <div class="sidebar-footer-wrap">
                    <ul>
                        <li><a href="single-hot-topic.html">Explore</a></li>
                        <li><a href="advertiser-panel.html">Advertising</a></li>
                        <li><a href="terms-of-service.html">Terms of Use</a></li>
                        <li><a href="privacy-policy.html">Privacy Policy</a></li>
                        <li><a href="cookies-policy.html">Cookies</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="about.html">Help Center</a></li>
                        <li><a href="javascript:voi(0)">©copyrights - 2023.</a></li>
                        <li>
                            <div class="language-box">
                                <select class="select">
                                    <option selected="">English</option>
                                    <option value="1">Bangla</option>
                                    <option value="2">French</option>
                                    <option value="3">Spenich</option>
                                </select>
                            </div>
                        </li>
                    </ul>
                    <div class="sidebar-footer__app">
                        <a href="#"><i class="fa-brands fa-google-play"></i></a>
                        <a href="#"><i class="fa-brands fa-apple"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tags End  -->
    </div>
</div>
<!-- Right Sidebar area end -->



@push('script')
<script>

$(document).ready(function() {
    $(this).find('.sidebar-user-hover').hide();

    $('.sidebar-user-wrap__item').hover(function() {

        console.log($(this));

        var fullname = $(this).find('.user-fullname').text();
        var username = $(this).find('.user-username').text();
        var following = $(this).find('.user-following').text();
        var followers = $(this).find('.user-followers').text();
        var profileImageSrc = $(this).find('img').attr('src');


        $('.sidebar-user-hover__content .user-fullname').text(fullname);
        $('.sidebar-user-hover__content .user-username').text(username);
        $('.sidebar-user-hover__content .user-following').text(following);
        $('.sidebar-user-hover__content .user-followers').text(followers);
        $('.sidebar-user-hover__content .user-profile-image').attr('src', profileImageSrc);
        $(this).find('.sidebar-user-hover').toggle();

    }, function() {

        $(this).find('.sidebar-user-hover').hide();
    });
});

</script>
@endpush

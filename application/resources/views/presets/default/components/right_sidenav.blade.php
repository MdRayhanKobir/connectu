 @php
    $hashtags = App\Models\Hashtag::latest()->inRandomOrder()->take(12)->get();
    $users = App\Models\User::active()->latest()->limit(5)->get();
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
            <h4 class="title">WHO TO FOLLOW</h4>
            <div class="sidebar-inner-wrap border-botm">
                <div class="sidebar-user-wrap">
                    <div class="sidebar-user-wrap__item">
                        <div class="sidebar-user-wrap__thumb">
                            <a href="">
                                <img src="assets/images/avatar/obaydul.png" alt="">
                            </a>
                        </div>
                        <div class="sidebar-user-wrap__content">
                            <h5 class="sidebar-user-wrap__content-show-auth-info"> <a
                                    href="single-user.html">Md. Obaydulla<i
                                        class="fa-solid fa-circle-check"></i></a></h5>
                            <p> <span> 6.5M</span> followers</p>
                        </div>

                        <!-- ======== Right Sidebar Hover Markup start ======== -->
                        <div class="sidebar-user-hover">
                            <div class="sidebar-user-hover__thumb-wrap">
                                <img class="cover-photo" src="assets/images/avatar/cover.png" alt="">
                                <div class="sidebar-user-wrap__thumb">
                                    <img src="assets/images/avatar/obaydul.png" alt="">
                                </div>
                            </div>
                            <div class="sidebar-user-hover__content">
                                <div class="sidebar-user-wrap__content">
                                    <div class="top">
                                        <h5> <a href="">
                                                Obaydul vai<i class="fa-solid fa-circle-check"></i></a>
                                            <span>@obaydul17</span>
                                        </h5>
                                    </div>
                                    <div class="followers">
                                        <a href="">170 Following</a>
                                        <a href="">378 followers</a>
                                    </div>
                                    <div class="bottom">
                                        <button class="btn btn--base btn--sm pill w-100">Follow</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ======== Right Sidebar Hover Markup end ======== -->

                    </div>
                    <div class="sidebar-user-wrap__item">
                        <div class="sidebar-user-wrap__thumb">
                            <a href="">
                                <img src="assets/images/avatar/ryhan.jpg" alt="">
                            </a>
                        </div>
                        <div class="sidebar-user-wrap__content">
                            <h5 class="sidebar-user-wrap__content-show-auth-info"> <a
                                    href="single-user.html">Md. Rayhan Kobir</a></h5>
                            <p> <span> 7.5M</span> followers</p>
                        </div>
                    </div>
                    <div class="sidebar-user-wrap__item">
                        <div class="sidebar-user-wrap__thumb">
                            <a href="">
                                <img src="assets/images/avatar/rajibvai.png" alt="">
                            </a>
                        </div>
                        <div class="sidebar-user-wrap__content">
                            <h5 class="sidebar-user-wrap__content-show-auth-info"> <a
                                    href="single-user.html">Rajib Raju</a></h5>
                            <p> <span> 6.5M</span> followers</p>
                        </div>
                    </div>
                    <div class="sidebar-user-wrap__item">
                        <div class="sidebar-user-wrap__thumb">
                            <a href="">
                                <img src="assets/images/avatar/mahmudul.png" alt="">
                            </a>
                        </div>
                        <div class="sidebar-user-wrap__content">
                            <h5 class="sidebar-user-wrap__content-show-auth-info"> <a
                                    href="single-user.html">Md Mahmudul Islam</a></h5>
                            <p> <span> 6.5M</span> followers</p>
                        </div>
                    </div>
                    <div class="sidebar-user-wrap__item">
                        <div class="sidebar-user-wrap__thumb">
                            <a href="">
                                <img src="assets/images/avatar/rifat.png" alt="">
                            </a>
                        </div>
                        <div class="sidebar-user-wrap__content">
                            <h5 class="sidebar-user-wrap__content-show-auth-info"> <a
                                    href="single-user.html">Rifatul Haque Khan<i
                                        class="fa-solid fa-circle-check"></i></a></h5>
                            <p> <span> 6.5M</span> followers</p>
                        </div>
                    </div>
                </div>
                <div class="sidebar-inner-wrap__bottom">
                    <h6><a href="all-user.html">Show More</a></h6>
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
                    <h6><a href="hot-topics.html">@lang('Show More')</a></h6>
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

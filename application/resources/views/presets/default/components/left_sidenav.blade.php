@php
$user = auth()->user();
@endphp
 <!-- Left sidebar menu start -->
 <div class="left-sidebar-parent-wrapper">
    <div class="left-sidebar-wrapper">
        <ul id="navbar" class="left-sidebar-menu">
            <li class="left-sidebar-menu__item profile">
                <a href="single-user.html"
                    class="left-sidebar-menu__link user  btn btn--base pill btn--rev">
                    <span class="icon"><img src="assets/images/avatar/obaydul.png" alt=""></span>
                    <span class="text">{{__(@$user->fullname)}}</span>
                </a>

                <!-- responsive handle -->
                <a href="single-user.html" class="left-sidebar-menu__link user-responsive">
                    <span class="icon"><img src="assets/images/avatar/obaydul.png" alt=""></span>
                </a>

            </li>
            <li class="left-sidebar-menu__item ">
                <a href="{{route('user.home')}}" class="left-sidebar-menu__link active">
                    <span class="icon"><i class="fas fa-home"></i></span>
                    <span class="text">@lang('Timeline')</span>
                </a>
            </li>
            <li class="left-sidebar-menu__item">
                <a href="notifications.html" class="left-sidebar-menu__link">
                    <span class="notification-animate">5</span>
                    <span class="icon"><i class="fa-solid fa-bell"></i></span>
                    <span class="text">Notifications</span>
                </a>
            </li>
            <li class="left-sidebar-menu__item">
                <a href="hot-topics.html" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fa-solid fa-fire-flame-simple icon"></i></span>
                    <span class="text">Trending</span>
                </a>
            </li>
            <li class="left-sidebar-menu__item">
                <a href="explore-all.html" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fa-solid fa-hashtag"></i></span>
                    <span class="text"> Explore</span>
                </a>
            </li>
            <li class="left-sidebar-menu__item">
                <a href="messages.html" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fa-solid fa-envelope"></i></span>
                    <span class="text"> Messages</span>
                </a>
            </li>
            <li class="left-sidebar-menu__item responsive-post-hidden" class="btn btn-primary"
                data-bs-toggle="modal" data-bs-target="#newPostMidal">
                <a href="javascript:void(0);" class="left-sidebar-menu__link btn btn--base pill">
                    <i class="fa-solid fa-address-card me-2"></i> New Post
                </a>
            </li>

            <!-- responsive handle -->
            <li class="left-sidebar-menu__item responsive-post-wrap" class="btn btn-primary"
                data-bs-toggle="modal" data-bs-target="#newPostMidal">
                <a href="javascript:void(0);" class="left-sidebar-menu__link btn btn--base pill">
                    <i class="fa-solid fa-address-card"></i>
                </a>
            </li>

            <li class="left-sidebar-menu__item">
                <a href="{{route('user.deposit')}}" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fas fa-dollar-sign"></i></span>
                    <span class="text"> @lang('Wallet')</span>
                </a>
            </li>
            <li class="left-sidebar-menu__item">
                <a href="{{route('user.fetch.plans')}}" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fas fa-gift"></i></span>
                    <span class="text">@lang('Pricing')</span>
                </a>
            </li>

            <li class="left-sidebar-menu__item {{ Route::is('user.ad.fetch') ? 'active' : '' }}">
                <a href="{{route('user.ad.fetch')}}" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fas fa-ad"></i></span>
                    <span class="text"> @lang('All Advertises')</span>
                </a>
            </li>
            <li class="left-sidebar-menu__item {{ Route::is('user.ad.index') ? 'active' : '' }}">
                <a href="{{route('user.ad.index')}}" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fas fa-ad"></i></span>
                    <span class="text"> @lang('Advertiser Panel')</span>
                </a>
            </li>

            <li class="left-sidebar-menu__item {{ Route::is('user.login') ? 'active' : '' }}">
                <a href="{{route('user.profile.setting')}}" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fas fa-user-astronaut"></i></span>
                    <span class="text">@lang('Account settings')</span>
                </a>
            </li>
            @auth
            <li class="left-sidebar-menu__item">
                <a href="{{ route('user.logout') }}" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
                    <span class="text">@lang('Logout')</span>
                </a>
            </li>
            @else
            <li class="left-sidebar-menu__item {{ Route::is('user.login') ? 'active' : '' }}">
                <a href="{{ route('user.login') }}" class="left-sidebar-menu__link">
                    <span class="icon"><i class="fas fa-sign-in-alt"></i></span>
                    <span class="text"> @lang('Sign In')</span>
                </a>
            </li>
            @endauth
        </ul>
    </div>


    <!--==== Mobile Responsive Left Sidebar Menu Start ==== -->

    <div class="responsive-left-sidebar-wrapper">
        <div class="left-sidebar-menu-scroll">
            <div class="top-close d-flex align-items-center justify-content-end mb-3">
                <i class="fa-solid fa-xmark close-hide-show"></i>
            </div>
            <ul id="navbar" class="responsive-left-sidebar-menu mt-3">
                <li class="responsive-left-sidebar-menu__item profile">
                    <a href="single-user.html"
                        class="responsive-left-sidebar-menu__link user  btn btn--base pill btn--rev">
                        <span class="icon"><img src="assets/images/avatar/obaydul.png" alt=""></span>
                        <span class="text"> Obaydul Vai</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item ">
                    <a href="index.html" class="responsive-left-sidebar-menu__link active">
                        <span class="icon"><i class="fa-solid fa-book-atlas"></i></span>
                        <span class="text"> Timeline</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="notifications.html" class="responsive-left-sidebar-menu__link">
                        <span class="notification-animate">5</span>
                        <span class="icon"><i class="fa-solid fa-bell"></i></span>
                        <span class="text">Notifications</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="hot-topics.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fa-solid fa-fire-flame-simple icon"></i></span>
                        <span class="text">Trending</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="explore-all.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fa-solid fa-hashtag"></i></span>
                        <span class="text"> Explore</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="messages.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fa-solid fa-envelope"></i></span>
                        <span class="text"> Messages</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item" class="btn btn-primary"
                    data-bs-toggle="modal" data-bs-target="#newPostMidal">
                    <a href="javascript:void(0);"
                        class="responsive-left-sidebar-menu__link btn btn--base pill">
                        <i class="fa-solid fa-address-card me-2"></i> New Post
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="wallet.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fa-solid fa-wallet"></i></span>
                        <span class="text"> Wallet (0.00$)</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="advertiser-panel.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fa-solid fa-rectangle-ad"></i></span>
                        <span class="text"> Advertiser Panel</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="ptc-add.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fa-solid fa-circle-dollar-to-slot"></i></span>
                        <span class="text"> Ptc Add</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="account-settings.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fas fa-user-astronaut"></i></span>
                        <span class="text"> Account settings</span>
                    </a>
                </li>
                <li class="responsive-left-sidebar-menu__item">
                    <a href="login.html" class="responsive-left-sidebar-menu__link">
                        <span class="icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                        <span class="text"> Logout</span>
                    </a>
                </li>
            </ul>

            <div class="sidebar-footer-wrap mb-4">
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

    <!--==== Mobile Responsive Left Sidebar Menu End ==== -->


    <!--==== Mobile Responsive Bottom Menu Start ==== -->
    <div class="mobile-menu-wrap">
        <ul id="mibileNavmenu" class="mobile-menu">
            <li class="mobile-menu__item mobile-responsive-icon">
                <button class="mobile-menu__link"><i class="fa-solid fa-ellipsis"></i></button>
            </li>
            <li class="mobile-menu__item">
                <a class="mobile-menu__link" href="index.html"><i
                        class="fa-solid fa-book-atlas"></i></a>
            </li>
            <li class="mobile-menu__item">
                <a class="mobile-menu__link active" href="index.html"><i
                        class="fa-solid fa-house"></i></a>
            </li>
            <li class="mobile-menu__item">
                <a class="mobile-menu__link" href="notifications.html"> <i class="fa-solid fa-bell"></i>
                </a>
            </li>
            <li class="mobile-menu__item">
                <a class="mobile-menu__link" href="messages.html"> <i
                        class="fa-regular fa-message"></i></a>
            </li>
        </ul>
    </div>
    <!--==== Mobile Responsive Bottom Menu End ==== -->
</div>
<!-- Left sidebar menu end -->

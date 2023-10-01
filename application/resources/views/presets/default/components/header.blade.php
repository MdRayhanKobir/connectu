   <!--========================== Header section Start ==========================-->
   <div class="header-main-wrappera">
    <div class="sticky-header">
        <div class="container position-relative">
            <div class="row">
                <div class="header-wrapper">

                    <div class="menu-wrapper">
                        <ul class="main-menu">
                            <li><a class='active' href="javascript:void(0)">{{__($pageTitle)}}</a></li>
                        </ul>
                    </div>

                    <div class="header-menu-wrapper align-items-center d-flex">
                        <div class="logo-wrapper">
                            <a href="{{ route('home') }}" class="normal-logo"> <img
                                src="{{ getImage(getFilePath('logoIcon') . '/logo.png', '?' . time()) }}"
                                alt="{{ config('app.name') }}"></a>
                        {{-- <a href="{{ route('home') }}" class="dark-logo hidden"> <img
                                src="{{ getImage(getFilePath('logoIcon') . '/logo_white.png', '?' . time()) }}"
                                alt="{{ config('app.name') }}">
                            </a> --}}
                        </div>
                    </div>

                    <div class="menu-right-wrapper">
                        <ul>
                            <li>
                                <div class="light-dark-btn-wrap ms-1" id="light-dark-checkbox">
                                    <i class="fas fa-moon mon-icon"></i>
                                    <i class='fas fa-sun sun-icon'></i>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!--========================== Header section End ==========================-->

<!doctype html>
<html lang="{{ config('app.locale') }}" itemscope itemtype="http://schema.org/WebPage">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> {{ $general->siteName(__($pageTitle)) }}</title>

    @include('includes.seo')



    <link href="{{ asset('assets/common/css/bootstrap.min.css') }}" rel="stylesheet">

    <link href="{{asset('assets/common/css/all.min.css')}}" rel="stylesheet">

    <link rel="stylesheet" href="{{asset('assets/common/css/line-awesome.min.css')}}" />

    <link rel="stylesheet" href="{{ asset($activeTemplateTrue.'css/custom.css') }}">
    @stack('style-lib')

    @stack('style')


    <style>
     .cookies-card {
            position: fixed;
            bottom: 16px;
            width: 40%;
            padding: 20px;
            background: #fff;
            border: 2px solid #108ce6;
            box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            right: 16px;
            z-index: 99;
            border: 2px solid #108ce6;
        }
        .dark-mode .cookies-card {
            background: #2d3748;
            border: 1px solid #404040;
        }
        @media (max-width:576px) {
            .cookies-card {
                width: 90%;
            }
        }
    </style>

    <link rel="stylesheet" href="{{ asset($activeTemplateTrue.'css/color.php') }}?color={{ $general->base_color }}&secondColor={{ $general->secondary_color }}">
</head>

<body>


    <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="{{ route('home') }}">
                <img src="{{ getImage('assets/images/general/logo.png') }}" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="@lang('Toggle navigation')">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ms-auto">

                    <select class="langSel form-control">
                        @foreach($language as $item)
                            <option value="{{ $item->code }}" @if(session('lang')==$item->code) selected @endif>{{ __($item->name) }}</option>
                        @endforeach
                    </select>



                    @guest
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('contact') }}">@lang('contact')</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('user.login') }}">@lang('login')</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"
                                href="{{ route('user.register') }}">@lang('register')</a>
                        </li>
                        @endguest
                        @auth
                        <li class="nav-item">
                            <a class="nav-link"
                            href="{{ route('user.home') }}">@lang('Dashboard')</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            @lang('Support Ticket')
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item"
                            href="{{ route('ticket.open') }}">@lang('Create New')</a>
                            <a class="dropdown-item" href="{{ route('ticket') }}">@lang('My
                                    Ticket')</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            @lang('Deposit')
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item"
                            href="{{ route('user.deposit') }}">@lang('Deposit Money')</a>
                            <a class="dropdown-item"
                            href="{{ route('user.deposit.history') }}">@lang('Deposit
                                    Log')</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                @lang('Withdraw')
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item"
                                    href="{{ route('user.withdraw') }}">@lang('Withdraw Money')</a>
                                <a class="dropdown-item"
                                    href="{{ route('user.withdraw.history') }}">@lang('Withdraw
                                    Log')</a>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('user.transactions') }}">@lang('Transactions')</a>
                        </li>


                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                {{ auth()->user()->fullname }} <span class="caret"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="{{ route('user.change.password') }}">
                                    @lang('Change Password')
                                </a>
                                <a class="dropdown-item" href="{{ route('user.profile.setting') }}">
                                    @lang('Profile Setting')
                                </a>
                                <a class="dropdown-item" href="{{ route('user.twofactor') }}">
                                    @lang('2FA Security')
                                </a>


                                <a class="dropdown-item" href="{{ route('user.logout') }}">
                                    @lang('Logout')
                                </a>

                            </div>
                        </li>
                    @endauth

                </ul>
            </div>
        </div>
    </nav>

    <div class="page-wrapper">
        @yield('content')
    </div>


    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="{{asset('assets/common/js/jquery-3.7.0.min.js')}}"></script>
    <script src="{{asset('assets/common/js/bootstrap.bundle.min.js')}}"></script>


    <script src="{{ asset($activeTemplateTrue.'js/jquery.validate.js') }}"></script>

    @stack('script-lib')

    @include('includes.notify')

    @include('includes.plugins')


    @stack('script')


    <script>
        (function ($) {
            "use strict";
            $(".langSel").on("change", function () {
                window.location.href = "{{ route('home') }}/change/" + $(this).val();
            });

        })(jQuery);

    </script>


    <script>
        (function ($) {
            "use strict";

            $('form').on('submit', function () {
                if ($(this).valid()) {
                    $(':submit', this).attr('disabled', 'disabled');
                }
            });

            var inputElements = $('[type=text],[type=password],select,textarea');
            $.each(inputElements, function (index, element) {
                element = $(element);
                element.closest('.form-group').find('label').attr('for',element.attr('name'));
                element.attr('id',element.attr('name'))
            });

            $.each($('input, select, textarea'), function (i, element) {

                if (element.hasAttribute('required')) {
                    $(element).closest('.form-group').find('label').addClass('required');
                }

            });


            $('.showFilterBtn').on('click',function(){
                $('.responsive-filter-card').slideToggle();
            });


            let headings = $('.table th');
            let rows = $('.table tbody tr');
            let columns
            let dataLabel;

            $.each(rows, function (index, element) {
                columns = element.children;
                if (columns.length == headings.length) {
                    $.each(columns, function (i, td) {
                    dataLabel = headings[i].innerText;
                    $(td).attr('data-label', dataLabel)
                    });
                }
            });

        })(jQuery);

    </script>

</body>

</html>

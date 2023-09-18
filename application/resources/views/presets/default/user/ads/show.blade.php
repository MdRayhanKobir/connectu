<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $general->siteName($pageTitle ?? '') }}</title>
    <link rel="shortcut icon" type="image/png" href="{{ getImage(getFilePath('logoIcon') . '/favicon.png') }}">
    <link href="{{ asset('assets/common/css/bootstrap.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue . 'css/main.css') }}">
    <script src="{{ asset('assets/common/js/jquery-3.7.0.min.js') }}"></script>
    <script>
        document.addEventListener('visibilitychange', function() {
            if (document.visibilityState === 'hidden') {
                document.body.innerHTML = `
                           <div class="d-flex flex-wrap justify-content-center align-items-center clear-msg">
                                <h3 class="text-danger text-center">@lang('Currently you are unavailable to view this add. Please dont\'t leave the window.')</h3>
                            </div>
                        `;
            }
        });
    </script>


</head>

<body>
    <div class="add_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="left-form d-none" id="left-form">
                        <form action="{{ route('user.ad.confirm', encrypt($ads->id . '|' . auth()->user()->id)) }}"
                            id="confirm-form" method="post">
                            @csrf
                            <div class="confirm-btn-wrap d-flex">
                                <div class="captcha">
                                    <x-captcha></x-captcha>
                                </div>
                                <button class="btn btn--base btn--sm pill">@lang('Confirm')</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="rounded" id="myProgress">
                        <div class="rounded" id="myBar">@lang('0%')</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        (function($, document) {
            "use strict";

            function move() {
                var elem = document.getElementById("myBar");
                var width = 0;
                var id = setInterval(frame, {{ $ads->duration * 10 }});

                function frame() {
                    if (width >= 100) {
                        clearInterval(id);
                        var xCaptcha = document.getElementById("left-form");
                        xCaptcha.classList.remove("d-none");

                    } else {
                        width++;
                        elem.style.width = width + '%';
                        elem.innerHTML = width + '%';
                    }
                }
            }

            window.onload = move;
        })(jQuery, document);
    </script>


    <div class="advertise-wrapper">
        @if ($ads->ads_type == 1)
            <iframe src="{{ $ads->ads_body }}" class="adFram"></iframe>
        @elseif($ads->ads_type == 2)
            <div class="container mt-5">
                <img src="{{ getImage(getFilePath('adsImage') . '/' . @$ads->ads_body) }}" class="w-100">
            </div>
        @elseif($ads->ads_type == 3)
            <div class="adBody">
                @php echo $ads->ads_body @endphp
            </div>
        @else
            <div class="d-flex justify-content-center">
                <div class="iframe-container">
                    <iframe src="{{ $ads->ads_body }}" title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                </div>
            </div>
        @endif

        @include('includes.notify')
    </div>
</body>

</html>

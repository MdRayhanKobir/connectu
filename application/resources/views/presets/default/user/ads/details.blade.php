@extends($activeTemplate.'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="hot-topic-wrapper account-settings">
        <div class="hot-topic-item heading">
            <h6 class="title">{{__($pageTitle)}}</h6>
        </div>

        <div class="hot-topic-item">
            <div class="transactions-table">
                <div class="order-wrap">
                    <table class="table table--responsive--lg">
                        <thead>
                            <tr>
                                <th>@lang('Duration')</th>
                                <th>@lang('Max Show')</th>
                                <th>@lang('Showed')</th>
                                <th>@lang('Remain')</th>
                                <th>@lang('Image/Link/Script')</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td data-label="Duration">{{__($adDetails->duration)}} </td>
                                <td data-label="Max Show">{{__($adDetails->max_show)}}</td>
                                <td data-label="Showed">{{__($adDetails->showed ? $adDetails->showed : 0 )}}</td>
                                <td data-label="Remain">{{__($adDetails->remain)}}</td>

                                @if($adDetails->ads_type == 2)
                                <td><img class="rounded" src="{{ getImage(getFilePath('adsImage').'/'.$adDetails->ads_body) }}" alt="@lang('image')" style="width:50px"></td>
                                @endif
                                @if($adDetails->ads_type == 1)
                                <td><span class="badge badge--success" title="{{$adDetails->ads_body}}"><i class="las la-link"></i></span></td>
                                @endif
                                @if($adDetails->ads_type == 3)
                                <td><span class="badge badge--success" title="{{$adDetails->ads_body}}"><i class="las la-comment-alt"></i></span></td>
                                @endif
                                @if($adDetails->ads_type == 4)
                                <td><span class="badge badge--success" title="{{$adDetails->ads_body}}"><i class="las la-link"></i></span></td>
                                @endif
                                <td>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection




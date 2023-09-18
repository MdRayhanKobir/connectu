@extends($activeTemplate.'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="wallet-wrapper">
        <div class="row gy-4 justify-content-center position-relative">

            <div class="col-sm-12 mt-4">
                <a href="{{route('user.ad.earning')}}" type="submit" class="btn btn--base pill w-100">
                    @lang('My All Earning') <i class="fas fa-solid fa-arrow-right"></i>
                    <span style="top: -1px; left: 369px;"></span>
                </a>
            </div>

            @forelse($ads as $item)
            <div class="col-lg-6 col-md-6">
                <div class="add-item">
                    <div class="add-item__content">
                        <h4 class="title" title="{{__($item->title)}}">
                            @if (strlen(__($item->title)) > 20)
                            {{ substr(__($item->title), 0, 20) . '...' }}
                            @else
                                {{ __($item->title) }}
                            @endif
                        </h4>
                        <h5 class="amont">{{__($general->cur_sym)}} {{showAmount($item->amount)}}</h5>
                        <p class="desc">@lang('Ads duration'): {{__($item->duration)}} @lang('s')</p>
                    </div>
                    <div class="add-bottom">
                        <a href="{{route('user.ad.show',encrypt($item->id.'|'.auth()->user()->id))}}" class="btn btn--base pil btn--sm">@lang('View Add')</a>
                    </div>
                </div>
            </div>
            @empty
            <span> {{__($emptyMessage)}}</span>
            @endforelse
            @if ($ads->hasPages())
            <div class="d-flex justify-content-center">
                {{ paginateLinks($ads) }}
            </div>
            @endif
        </div>
    </div>
</div>
@endsection

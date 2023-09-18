@extends($activeTemplate .'layouts.master')
@section('content')
    <div class="timeline-mt-60">
        <div class="wallet-wrapper">
            <div class="row gy-4 justify-content-center position-relative">
                @foreach ($plans as $item)
                    <div class="col-lg-6 col-md-6">
                        <div class="pricing-plan-item">
                            <div class="price-shape-2"></div>
                            <div class="pricing-plan-item__top">
                                <h3 class="title">{{__($item->name) }}</h3>
                            </div>
                            <div class="pricing-plan-item__price">
                                <h3 class="title">{{__($general->cur_sym) }}
                                    {{ showAmount($item->price) }}<span>{{ $item->type == 1 ? '/m' : '/y' }}</span> </h3>
                            </div>
                            <div class="pricing-plan-item__list">
                                <ul>
                                    <li> <i class="fas fa-check-circle"></i> @lang('Daily Ad View'): {{__($item->daily_view_limit) }}</li>
                                    <li> <i class="fas fa-check-circle"></i> @lang('Create Ad'): {{__($item->create_ad_limit) }}</li>
                                    @if (@$item->content)
                                        @foreach (json_decode(@$item->content) as $value)
                                            <li> <i class="fas fa-check-circle"></i>{{ $value }}</li>
                                        @endforeach
                                    @endif
                                </ul>
                            </div>
                            <div class="pricing-plan-item__bottom">
                                <a class="btn btn--base" href="{{route('user.payment',$item->id)}}">
                                    @lang('Get Started') <i class="fas fa-solid fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection

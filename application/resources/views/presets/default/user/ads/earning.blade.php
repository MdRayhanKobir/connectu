@extends($activeTemplate.'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="wallet-wrapper">
        <div class="row gy-4">
            <div class="col-sm-6 mt-4">
                <a href="{{route('user.withdraw')}}" type="submit" class="btn btn--base pill w-100">
                    @lang('Withdrawls') <i class="fas fa-solid fa-arrow-right"></i>
                    <span style="top: -1px; left: 369px;"></span>
                </a>
            </div>
            <div class="col-sm-6 mt-4">
                <a href="{{route('user.withdraw.history')}}" type="submit" class="btn btn--base pill w-100">
                    @lang('Withdrawls Log') <i class="fas fa-solid fa-arrow-right"></i>
                    <span style="top: -1px; left: 369px;"></span>
                </a>
            </div>
            <div class="col-xl-12 col-lg-6">
                <div class="add-item">
                    <div class="earning-header">
                        <h5>@lang('Earning Balance Status')</h5>
                    </div>
                    <div class="earning-card">
                        <ul class="earning-type">
                            <li>
                                <span>@lang('Main Balance'):</span>
                                <span>{{__($general->cur_sym)}} {{showAmount($user->balance)}}</span>
                            </li>
                            <li>
                                <span>@lang('Ads Earning'):</span>
                                <span>{{__($general->cur_sym)}} {{showAmount($total['adsEarn'])}}</span>
                            </li>
                            <li>
                                <span>@lang('Pending Withdrawls'):</span>
                                <span>{{__($general->cur_sym)}} {{showAmount($total['pendingWithdraw'])}}</span>
                            </li>
                            <li>
                                <span>@lang('Total Withdrawls'):</span>
                                <span>{{__($general->cur_sym)}} {{showAmount($total['Withdraw'])}}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
@endsection

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
                    <div class="row justify-content-end">
                        <div class="col-md-6 mb-3 text-end">
                            <a  href="{{route('user.ad.create')}}" class="btn btn--base pill btn--sm"><i class="fas fa-plus"></i> @lang('add')</a>
                        </div>
                    </div>
                    <table class="table table--responsive--lg">
                        <thead>
                            <tr>
                                <th>@lang('Title')</th>
                                <th>@lang('Amount')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($ads as $ad)
                            <tr>
                                <td data-label='Title'>{{strLimit($ad->title,20)}}</td>
                                <td data-label='Amount'>{{ showAmount($ad->amount) }} {{$general->cur_text}}</td>
                                <td data-label='Status'>@php echo $ad->statusBadge($ad->status); @endphp</td>
                                <td data-label='Action'>
                                    <div class="button--group">
                                         <a href="{{route('user.ad.edit',$ad->id)}}" class="btn btn--sm btn--base" title="edit"><i class="las la-edit"></i></a>
                                         <a href="" class="btn btn--base btn--sm btn--danger" title="edit"><i class="las la-trash"></i></a>
                                         <a href="{{route('user.ad.details',$ad->id)}}" class="btn btn--sm btn--base btn--warning" title="edit"><i class="las la-eye"></i></a>
                                    </div>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td data-label='Ad Table' class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection




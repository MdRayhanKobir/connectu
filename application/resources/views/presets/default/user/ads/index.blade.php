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
                                         <a href="{{route('user.ad.edit',$ad->id)}}" class="btn btn--sm btn--base btn--info outline pill" title="edit"><i class="las la-edit"></i></a>
                                         <button class="btn btn--base btn--sm outline btn--danger pill deleteBtn" title="edit" data-id="{{$ad->id}}"><i class="las la-trash"></i></button>
                                         <a href="{{route('user.ad.details',$ad->id)}}" class="btn btn--sm btn--base btn--warning outline pill" title="edit"><i class="las la-eye"></i></a>
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
                @if ($ads->hasPages())
                <div class="d-flex justify-content-center">
                    {{ paginateLinks($ads) }}
                </div>
                @endif
            </div>
        </div>
    </div>
</div>

{{-- delete ad --}}
<div id="deleteBtntModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Ad Delete Confirmation!')</h5>
                <button type="button" class="close btn btn--sm btn--danger outline pill" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <form action="{{route('user.ad.delete')}}" method="get">
                @csrf
                <input type="hidden" name="id">
                <div class="modal-body">
                    <p>@lang('Are you sure you want to delete this ad?')
                    </p>
                </div>
                <div class="modal-footer">
                    <div class="buttorn_wrapper">
                        <button type="submit" class="btn btn--base  btn--sm pill"> <span class="btn_title">@lang('Delete') <i
                                    class="fa-solid fa-angles-right"></i></span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@push('script')
    <script>
        (function($) {
            "use strict";
            $('.deleteBtn').on('click', function() {
                var modal = $('#deleteBtntModal');
                modal.find('input[name=id]').val($(this).data('id'));
                modal.modal('show');
            });

        })(jQuery);
    </script>
@endpush




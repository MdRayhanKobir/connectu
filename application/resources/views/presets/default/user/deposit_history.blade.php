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
                            <form action="">
                                <div class="search-box w-100">
                                    <input type="text" name="search" class="form--control" value="{{ request()->search }}"
                                    placeholder="@lang('Search by transactions')">
                                    <button type="submit" class="search-box__button deposit-search "><i class="fas fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <table class="table table--responsive--lg">
                        <thead>
                            <tr>
                                <th>@lang('Gateway')</th>
                                <th class="text-center">@lang('Initiated')</th>
                                <th class="text-center">@lang('Amount')</th>
                                <th class="text-center">@lang('Status')</th>
                                <th>@lang('Details')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($deposits as $deposit)
                            <tr>
                                <td>{{__($deposit->gateway?->name) }}</td>

                                <td class="text-center">
                                    {{ showDateTime($deposit->created_at) }}
                                </td>

                                <td class="text-center">
                                    {{ __($general->cur_sym) }}{{ showAmount($deposit->amount ) }}
                                </td>

                                <td class="text-center">
                                    @php echo $deposit->statusBadge @endphp
                                </td>
                                @php
                                $details = ($deposit->detail != null) ? json_encode($deposit->detail) : null;
                                @endphp

                                <td>
                                    <a href="javascript:void(0)"
                                        class="btn btn--base btn--sm outline  @if($deposit->method_code >= 1000) detailBtn @else disabled @endif"
                                        @if($deposit->method_code >= 1000)
                                        data-info="{{ $details }}"
                                        @endif
                                        @if ($deposit->status == 3)
                                        data-admin_feedback="{{ $deposit->admin_feedback }}"
                                        @endif>
                                        <i class="fa fa-eye"></i>
                                    </a>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>

                    @if($deposits->hasPages())
                    <div class="text-end">
                        {{ $deposits->links() }}
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

{{-- APPROVE MODAL --}}
<div id="detailModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Details')</h5>
                <span type="button" class="close btn btn--base btn--danger outlline pill btn--sm" data-bs-dismiss="modal" aria-label="Close">
                    <i class="las la-times"></i>
                </span>
            </div>
            <div class="modal-body">
                <ul class="list-group userData mb-2">
                </ul>
                <div class="feedback"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn--base btn--sm" data-bs-dismiss="modal">@lang('Close')</button>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    (function ($) {
        "use strict";
        $('.detailBtn').on('click', function () {
            var modal = $('#detailModal');

            var userData = $(this).data('info');
            var html = '';
            if (userData) {
                userData.forEach(element => {
                    if (element.type != 'file') {
                        html += `
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>${element.name}</span>
                                <span">${element.value}</span>
                            </li>`;
                    }
                });
            }

            modal.find('.userData').html(html);

            if ($(this).data('admin_feedback') != undefined) {
                var adminFeedback = `
                        <div class="my-3">
                            <strong>@lang('Admin Feedback')</strong>
                            <p>${$(this).data('admin_feedback')}</p>
                        </div>
                    `;
            } else {
                var adminFeedback = '';
            }

            modal.find('.feedback').html(adminFeedback);


            modal.modal('show');
        });
    })(jQuery);

</script>
@endpush







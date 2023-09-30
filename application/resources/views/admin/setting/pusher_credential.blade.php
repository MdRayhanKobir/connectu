@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-md-12">
            <div class="card b-radius--10 ">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two custom-data-table">
                            <thead>
                                <tr>
                                    <th>@lang('Title')</th>
                                    <th>@lang('App Key')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach (gs()->pusher_credential as $key => $credential)

                                <tr>
                                    <td class="fw-bold">{{ ucfirst($key) }}</td>
                                    <td>{{ $credential }}</td>
                                    <td>
                                        <button class=" btn btn-sm btn--primary editBtn" data-app_id="{{ gs()->pusher_credential->app_id }}"
                                            data-app_key="{{ gs()->pusher_credential->app_key }}"
                                            data-app_secret="{{ gs()->pusher_credential->app_secret }}" data-app_cluster ="{{gs()->pusher_credential->app_cluster}}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                               @endforeach
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- EDIT METHOD MODAL --}}
    <div id="editModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Update Credential'): <span class="credential-name"></span></h5>
                    <button type="button" class="close btn btn--primary" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form method="POST" action="{{route('admin.setting.pusher.credentials.update')}}">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('Api Id')</label>
                            <input type="text" class="form-control" name="app_id">
                        </div>
                        <div class="form-group">
                            <label>@lang('App Key')</label>
                            <input type="text" class="form-control" name="app_key">
                        </div>
                        <div class="form-group">
                            <label>@lang('App Secret')</label>
                            <input type="text" class="form-control" name="app_secret">
                        </div>
                        <div class="form-group">
                            <label>@lang('App Cluster')</label>
                            <input type="text" class="form-control" name="app_cluster">
                        </div>
                        <div class="form-group">
                            <label>@lang('UseTLS')</label>
                            <input type="text" class="form-control" name="useTLS" value="true" readonly>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary" id="editBtn">@lang('Submit')</button>
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

            $(document).on('click', '.editBtn', function() {
            let modal = $('#editModal');
            let app_id = $(this).data('app_id');
            let app_key = $(this).data('app_key');
            let app_secret = $(this).data('app_secret');
            let app_cluster = $(this).data('app_cluster');

            // Populate the modal fields
            modal.find('input[name=app_id]').val(app_id);
            modal.find('input[name=app_key]').val(app_key);
            modal.find('input[name=app_secret]').val(app_secret);
            modal.find('input[name=app_cluster]').val(app_cluster);




    modal.modal('show');
});


        })(jQuery);
    </script>
@endpush

@extends($activeTemplate.'layouts.master')
@section('content')
<div class="timeline-mt-60">
    <div class="hot-topic-wrapper account-settings">
        <div class="hot-topic-item heading">
            <h6 class="title">{{__($pageTitle)}}</h6>
        </div>

        <div class="hot-topic-item">
            <form action="{{route('user.ad.store')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="row gy-3">
                    <div class="form-group col-md-12">
                        <label class="form--label">@lang('Title of the Ad') <span class="text-danger">*</span></label>
                        <input type="text" name="title" class="form--control" value="{{ old('title') }}"
                            placeholder="@lang('Title')" required>
                    </div>

                    <div class="form-group col-md-12">
                        <label class="form--label">@lang('Amount') <span class="text-danger">*</span></label>
                        <div class="input-text d-flex">
                            <div class="input-group">
                                <input type="number" step="any" name="amount" class="form--control border-right-zero"
                                    value="{{ old('amount') }}" placeholder="@lang('User will get')" required>
                            </div>
                            <div class="input-group-text"> {{ $general->cur_text }} </div>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label class="form--label">@lang('Duration') <span class="text-danger">*</span></label>
                        <div class="input-text d-flex">
                            <div class="input-group">
                                <input type="number" name="duration" class="form--control" value="{{ old('duration') }}"
                                    placeholder="@lang('Duration')" required>
                            </div>
                            <div class="input-group-text">@lang('SECONDS')</div>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label class="form--label">@lang('Maximum Show') <span class="text-danger">*</span></label>
                        <div class="input-text d-flex">
                            <div class="input-group">
                                <input type="number" name="max_show" class="form--control" value="{{ old('max_show') }}"
                                    placeholder="@lang('Maximum Show') " required>
                            </div>
                            <div class="input-group-text">@lang('Times')</div>
                        </div>
                    </div>

                    <div class="form-group col-md-12">
                        <label class="form--label">@lang('Status') </label>
                        <label class="switch m-0">
                            <input type="checkbox" class="toggle-switch" name="status">
                            <span class="slider round"></span>
                        </label>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="ads_type" class="form--label">@lang('Advertisement Type')</label>
                        <select class="form--control" id="ads_type" name="ads_type" required>
                            <option value="1" {{ old('ads_type')==1?'selected':'' }}>@lang('Link / URL')</option>
                            <option value="2" {{ old('ads_type')==2?'selected':'' }}>@lang('Banner / Image')
                            </option>
                            <option value="3" {{ old('ads_type')==3?'selected':'' }}>@lang('Script / Code')</option>
                            <option value="4" {{ old('ads_type')==4?'selected':'' }}>@lang('Youtube Embeded Link')
                            </option>
                        </select>
                    </div>

                    <div class="form-group col-md-8" id="websiteLink">
                        <label>@lang('Link')</label>
                        <input type="text" name="website_link" class="form--control"
                            value="{{ old('website_link') }}" placeholder="@lang('http://example.com')">
                    </div>

                    <div class="form-group col-md-8" id="youtube">
                        <label class="form--label">@lang('Youtube Embeded Link')</label>
                        <input type="text" name="youtube" class="form--control" value="{{ old('youtube') }}"
                            placeholder="@lang('https://www.youtube.com/embed/your_code')">
                    </div>

                    <div class="form-group col-md-8 d-none" id="bannerImage">
                        <label>@lang('Banner')</label>
                        <input type="file" class="form--control" name="image">
                    </div>

                    <div class="form-group col-md-8 d-none" id="script">
                        <label class="form--label">@lang('Script')</label>
                        <textarea name="script" class="form--control">{{ old('script') }}</textarea>
                    </div>

                    <div class="form-group col-md-12 mt-3 text-end">
                        <button type="submit" class="btn btn--base pill w-100">@lang('Submit')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('script')
<script>
    (function ($) {
        "use strict";
        $('#ads_type').change(function () {
            var adType = $(this).val();
            if (adType == 1) {
                $("#websiteLink").removeClass('d-none');
                $("#bannerImage").addClass('d-none');
                $("#script").addClass('d-none');
                $("#youtube").addClass('d-none');
            } else if (adType == 2) {
                $("#bannerImage").removeClass('d-none');
                $("#websiteLink").addClass('d-none');
                $("#script").addClass('d-none');
                $("#youtube").addClass('d-none');
            } else if (adType == 3) {
                $("#bannerImage").addClass('d-none');
                $("#websiteLink").addClass('d-none');
                $("#script").removeClass('d-none');
                $("#youtube").addClass('d-none');
            } else {
                $("#bannerImage").addClass('d-none');
                $("#websiteLink").addClass('d-none');
                $("#script").addClass('d-none');
                $("#youtube").removeClass('d-none');
            }
        }).change();
    })(jQuery);
</script>
@endpush



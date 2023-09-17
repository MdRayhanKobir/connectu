@extends($activeTemplate.'layouts.frontend')
@section('content')


    <section class="container py-5">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        <h3 class="section-title">{{ __($pageTitle) }}</h3>
                    </div>
                    <div class="card-body">
                        <div class="wyg">
                            @php
                                echo $policy->data_values->details
                            @endphp
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

@endsection

@push('style')
<style>
    .wyg h1, h2, h3, h4{
        color:#383838;
    }
    .wyg strong{
        color:#383838
    }
    .wyg p{
        color: #666666
    }
    .wyg ul{
        margin-left: 40px
    }
    .wyg ul li{
        list-style-type: disc;
        color: #666666
    }
    .section-title{
        font-size: 30px;
        margin-bottom: 0;
    }
</style>
@endpush

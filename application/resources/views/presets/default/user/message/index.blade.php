
@extends($activeTemplate .'layouts.master')
@section('content')
     <!-- ======== Right Sidebar Hover Markup start ======== -->
     <div class="single-user-profile timeline-mt-60">
        <div class="single-user-profile__content">
           <div class="top-form-wrapper pt-3">
                <form action="#" autocomplete="off">
                    <div class="search-box w-100">
                        <input type="text" class="form--control" placeholder="Search for contacts, enter username">
                        <button type="submit" class="search-box__button"><i class="fas fa-search"></i></button>
                    </div>
                </form>
           </div>
        </div>
    </div>
    <!-- ======== Right Sidebar Hover Markup end ======== -->

   <!--========================== All Message Start ==========================-->
   @foreach ($users as $user)
        <div class="timeline-single-post-wrap position-relative">
            <div class="timeline-single-post">
                <a href="{{route('user.message.get.chatbox',$user->id)}}" class="position-absolute w-100 h-100 top-0">
                    <div class="timeline-single-post__avatar-wrap">
                        <div class="avatar">
                            <a href="javascript:void(0)"><img src="{{ getImage(getFilePath('userProfile') . '/' . @$user->image, getFileSize('userProfile')) }}" alt="@lang('user profile')"></a>
                        </div>
                    </div>
                    <div class="timeline-single-post__content d-flex justify-content-between align-items-center">
                        <div class="timeline-single-post__content-top-wrapper">
                            <div class="single-user-profile__content p-0">
                                <div class="top single-user">
                                    <h5 class="mb-0 d-flex">
                                        <a href="{{route('user.message.get.chatbox',$user->id)}}" class="d-flex align-items-center">
                                            {{__($user->fullname)}}<i class="fa-solid fa-circle-check"></i>
                                            <p class="ms-1">@ {{__($user->username)}}</p>
                                        </a>
                                    </h5>
                                </div>
                                <div class="followers d-flex mb-0">
                                    <p>Hi How are You?</p>
                                </div>
                            </div>
                        </div>
                        <div class="follow-wrapper">
                            <a href=""><i class="las la-angle-right"></i></a>
                        </div>

                    </div>
                </a>
            </div>
        </div>
   @endforeach

    <!--========================== All Message End ==========================-->

@endsection

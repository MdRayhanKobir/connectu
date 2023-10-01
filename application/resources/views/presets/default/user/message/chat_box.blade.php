
@extends($activeTemplate .'layouts.master')
@section('content')
<div class="single-user-profile border-0 p-0 timeline-mt-60">
    <div class="message-middle-sidebar">
        <div class="message-middle-sidebar__body msg-list-wraper">
            @foreach($messages as $message)
                @if($message->sender_id != Auth::id())
                    <div class="item">
                        <div class="thumb-content-left">
                            <div class="thumb">
                                <img src="{{ getImage(getFilePath('userProfile').'/'.$message->sender->image,getFileSize('userProfile')) }}" title="{{$message->sender->username}}">
                                <span>{{ date('h:i a',strtotime($message->created_at)) }}</span>
                            </div>
                        </div>
                        <div class="name">
                            @if($message->attachment && $message->message )
                            <div class="img-text">
                                <a href="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" target="_blank">
                                    <img src="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" alt="">
                                </a>
                                <br>
                                <p>{{$message->message}}</p>
                            </div>

                            @elseif($message->attachment)
                            <div class="message-file">
                                <a href="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" target="_blank">
                                    <img src="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" alt="">
                                </a>
                            </div>
                            @else
                            <p>{{$message->message}}</p>
                            @endif
                        </div>

                    </div>
                @else
                    <div class="item right-msg">
                        <div class="name">
                            @if($message->attachment && $message->message )
                            <div class="img-text">
                                <a href="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" target="_blank">
                                    <img src="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" alt="">
                                </a>
                                <p>{{$message->message}}</p>
                            </div>

                            @elseif($message->attachment)
                        <div class="message-file">
                            <a href="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" target="_blank">
                                <img src="{{ getImage(getFilePath('chatFiles').'/'.$message->attachment) }}" alt="">
                            </a>
                        </div>
                            @else
                            <p>{{$message->message}}</p>
                            @endif
                        </div>
                        <div class="thumb-content-left">
                            <div class="thumb">
                                <img src="{{ getImage(getFilePath('userProfile').'/'.$message->sender->image,getFileSize('userProfile')) }}" title="{{$message->sender->username}}">
                                <span>{{ date('h:i a', strtotime($message->created_at)) }}</span>
                            </div>
                        </div>
                    </div>
                @endif

            @endforeach
        </div>

    </div>
        <div class="image-preview-container">
            <img id="imagePreview" src="" alt="" style="width:100px">
            <span id="clearImage" class="remove-image" style="display: none;">&times;</span>
        </div>
    <div class="bottom">
        <form id="messageForm" method="post" enctype="multipart/form-data">
            @csrf
            <div class="search-box w-100">
                <textarea id="emojionearea1" type="text" class="form--control"  name="message" id="message" placeholder="@lang('Write your message') ..."> </textarea>
                <input type="hidden" name="receiver_id" value="{{$receiverUser->id}}">
                <button class="search-box__button msg-submit-btn">
                    <i class="fas fa-paper-plane"></i>
                </button>

                <div class="profile_photo">
                    <div class="photo_upload">
                        <label for="attachment"><i class="fas fa-link"></i></label>
                        <input type="file" name="attachment" class="upload_file">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection


@if (auth()->user())
@push('script')
<script src="{{asset($activeTemplateTrue.'js/pusher.min.js')}}"></script>

<script>
    var msgContainer = document.querySelector('.message-middle-sidebar__body');
    msgContainer.scrollTop = msgContainer.scrollHeight;

    const textarea = $('#emojionearea1');
        const imagePreview = $('#imagePreview');
        const clearImage = $('#clearImage');
        const fileInput = $('.upload_file');

        fileInput.on('change', function(e) {
            if (fileInput[0].files && fileInput[0].files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    textarea.hide();
                    imagePreview.attr('src', e.target.result).show();
                    clearImage.show();
                };
                reader.readAsDataURL(fileInput[0].files[0]);
            }
        });

        clearImage.on('click', function() {
            textarea.val(''); // Clear the textarea content
            textarea.show();
            imagePreview.attr('src', '').hide();
            clearImage.hide();
            fileInput.val(''); // Clear the file input
        });

    $('.msg-submit-btn').on('click', function(e) {
            e.preventDefault();
            var message = $("textarea[name=message]").val();
            var receiver_id = $("input[name=receiver_id]").val();
            var attachment = $('input[name=attachment]')[0].files;
            let message_list_wrapper = $('.msg-list-wraper');

            var formData = new FormData();
            formData.append('message', message);
            formData.append('receiver_id', receiver_id);

            if (attachment.length > 0) {
                for (var i = 0; i < attachment.length; i++) {
                    formData.append('attachment', attachment[i]);
                }
            }

            if (message == '' && attachment.length == 0) {
                Toast.fire({
                    icon: 'error',
                    title: 'Message and files are empty.',
                });
                return;
            }

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

        $.ajax({
            type: "post",
            url: "{{ route('user.message.send') }}",
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {

                if (data.attachment != null && data.message != null) {
                    message_list_wrapper.append(`
                        <div class="item right-msg">
                            <div class="name">
                                <img src="${data.attachment}"></img>
                                <p>${data.message}</p>
                            </div>
                            <div class="thumb-content-left">
                                <div class="thumb">
                                    <img src="${data.senderImag}" alt="user image">
                                    <span>${data.sendTime}</span>
                                </div>
                            </div>
                        </div>
                        `);
                } else if (data.attachment == null && data.message != null) {
                    message_list_wrapper.append(`
                        <div class="item right-msg">
                            <div class="name">
                                <p>${data.message}</p>
                            </div>
                            <div class="thumb-content-left">
                                <div class="thumb">
                                    <img src="${data.senderImag}" alt="user image">
                                    <span>${data.sendTime}</span>
                                </div>
                            </div>
                        </div>
                        `);
                } else {
                    message_list_wrapper.append(`
                    <div class="item right-msg">
                            <div class="name">
                                <img src="${data.attachment}"></img>
                            </div>
                            <div class="thumb-content-left">
                                <div class="thumb">
                                    <img src="${data.senderImag}" alt="user image">
                                    <span>${data.sendTime}</span>
                                </div>
                            </div>
                        </div>
                        `);
                }

                $('input[name=attachment]').val(null);
                $('textarea[name=message]').val('');

                var chatBox = $('.msg-list-wraper')[0];
                chatBox.scrollTop = chatBox.scrollHeight;
            },
            error: function(data, status, error) {
                $('input[name=attachment]').val(null);
                ('textarea[name=message]').text('');
                $.each(data.responseJSON.errors, function(key,
                    item) {
                    Toast.fire({
                        icon: 'error',
                        title: item
                    })
                });
            }
        });
    })



    // Pusher Setup and Credential and Sender - Receiver Function Start
    var app_key = @json(gs()->pusher_credential->app_key);
    var app_cluster = @json(gs()->pusher_credential->app_cluster);
    var my_channel = "{{ auth()->user()->id }}";
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    // Pusher.logToConsole = true;
    var pusher = new Pusher(
        app_key, {
            cluster: app_cluster
        });
    var channel = pusher.subscribe(my_channel);
    channel.bind('App\\Events\\Chat', function(data) {


        let message_list_wrapper = $('.msg-list-wraper');
        if (data.receiver == my_channel) {

            if (data.attachment != null && data.message != null) {
                    message_list_wrapper.append(`
                        <div class="item right-msg">
                            <div class="name">
                                <img src="${data.attachment}"></img>
                                <p>${data.message}</p>
                            </div>
                            <div class="thumb-content-left">
                                <div class="thumb">
                                    <img src="${data.senderImag}" alt="user image">
                                    <span>${data.sendTime}</span>
                                </div>
                            </div>
                        </div>
                        `);
                } else if (data.attachment == null && data.message != null) {
                    message_list_wrapper.append(`
                        <div class="item right-msg">
                            <div class="name">
                                <p>${data.message}</p>
                            </div>
                            <div class="thumb-content-left">
                                <div class="thumb">
                                    <img src="${data.senderImag}" alt="user image">
                                    <span>${data.sendTime}</span>
                                </div>
                            </div>
                        </div>
                        `);
                } else {
                    message_list_wrapper.append(`
                    <div class="item right-msg">
                            <div class="name">
                                <img src="${data.attachment}"></img>
                            </div>
                            <div class="thumb-content-left">
                                <div class="thumb">
                                    <img src="${data.senderImag}" alt="user image">
                                    <span>${data.sendTime}</span>
                                </div>
                            </div>
                        </div>
                        `);
                }
        }
        var chatBox = $('.msg-list-wraper')[0];
        chatBox.scrollTop = chatBox.scrollHeight;
    });

</script>

    @endpush
@endif

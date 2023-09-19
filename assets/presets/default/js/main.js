  /*============== Main Js Start ========*/
(function ($) {
  "use strict";

  /*============== Header Hide Click On Body Js ========*/
  $('.navbar-toggler.header-button').on('click', function() {
    if($('.body-overlay').hasClass('show')){
      $('.body-overlay').removeClass('show');
    }else{
      $('.body-overlay').addClass('show');
    }
  });
  $('.body-overlay').on('click', function() {
    $('.header-button').trigger('click');
  });

/*==================== Poll post  js ===============*/
    $('#add-mote-poll').click(function() {
    var pollWrapper = $(' <div class="poll-item"><input type="text" class="form--control" placeholder="Option"><span class="cancel-poll">cancel</span></div>');
    $('.poll-wrapper').append(pollWrapper);
    });

    $('.poll-wrapper').on('click', '.cancel-poll', function() {
    $(this).parent('.poll-item').remove();
    });

    $(".wallet-top__bottom button").click(function() {
    var topUpValue = $(this).text(); // Get the text value of the clicked button
    $("#name").val(topUpValue); // Set the value of the input field
    });  


/* ==========================================
  *   Start Document Ready function
==========================================*/
  $(document).ready(function () {

/*==================== Right Sidebar Scroll ===============*/
    $(window).scroll(function() {
        var scrollTop = $(window).scrollTop();
        var sidebarHeight = $(".right-sidebar-wrapper").height();
        var windowHeight = $(window).height();

        if (scrollTop + windowHeight >= sidebarHeight) {
          $(".right-sidebar-wrapper").css("bottom", "0");
        } else {
          $(".right-sidebar-wrapper").css("bottom", "");
        }
      });

/*==================== Left side menu active class add and remove ===============*/

/*====== Left Sidebar menu active Class ======*/

// Get all the nav-links inside the navbar
const navLinks = $('#navbar .left-sidebar-menu__link');

// Add click event handler to each left-sidebar-menu__link
    navLinks.on('click', function(event) {
        event.preventDefault(); 
        removeActiveClass(); 
        $(this).addClass('active'); 
        // Store the active left-sidebar-menu__link in sessionStorage to remember the state after reload
        sessionStorage.setItem('activeNavLink', $(this).attr('href'));
        // Navigate to the clicked link
        window.location.href = $(this).attr('href');
    });
    // Remove active class from all left-sidebar-menu__links
    function removeActiveClass() {
        navLinks.removeClass('active');
    }
    // Check if there is a stored active left-sidebar-menu__link and add active class on page load
    const storedActiveNavLink = sessionStorage.getItem('activeNavLink');
    if (storedActiveNavLink) {
        removeActiveClass();
        const activeNavLink = $(`#navbar .left-sidebar-menu__link[href="${storedActiveNavLink}"]`);
        activeNavLink.addClass('active');
    }


/*==================== Timeline Top Post count post ===============*/

// Timeline Post letter count
    $('.timeline-post-area').on('input', function() {
        var textLength = $(this).val().length;
        var timelineTopTotalCount = 200;

        $('.timeline-top-post-start').text(textLength);

        if (textLength > timelineTopTotalCount) {
            $(this).val($(this).val().substring(0, timelineTopTotalCount));
            $('.timeline-top-post-start').text(timelineTopTotalCount);
        }
    });

    // when typing for post then  public button disable and enable
    $('.timeline-post-area').on('input', function() {
      if ($(this).val().trim() === '') {
        $('.disable_enable').attr('disabled', 'disabled');
      } else {
        $('.disable_enable').removeAttr('disabled');
      }
    });

  /*=================== Replay menu Js ===================*/
  $('.reply-menu__item').on('click', function() {
    var postTopMenu = $(this).find('.reply-menu.submenu');
    if (postTopMenu.hasClass('show')) {
        postTopMenu.removeClass('show');
        $('.body-overlay').removeClass('everyone-btn-hide');
    } else {
        $('.reply-menu.submenu').removeClass('show');
        $(this).find('.reply-menu.submenu').addClass('show');
        $('.body-overlay').addClass('everyone-btn-hide');
    }
});

$('.body-overlay').on('click', function() {
  $('.reply-menu.submenu').removeClass('show');
  $('.body-overlay').removeClass('everyone-btn-hide');
});

  // Replace submenu content
  $(".sub-menu-item").click(function() {
    var icon = $(this).find(".icon").html();
    var text = $(this).find(".text").text();
    $(".replace-menu-item .icon").html(icon);
    $(".replace-menu-item .text").text(text);
  });

// when click submenu item then add checked icon active class
  $('.sub-menu-item').click(function() {
    // Remove 'active' class from all other elements
    $('.sub-menu-item').removeClass('active');
    
    // Add 'active' class to the clicked element
    $(this).addClass('active');

      // Hide parent reply-menu submenu
      $('.reply-menu.submenu').toggleClass('show')
});


 /*=================== Timeline Single Post Js ===================*/

//======== social button animation class added
$('.timeline-single-post__bottom-control .social-wrap button .icon').on('click', function() {
    // Remove 'clicked' class from all other .icon elements
    $('.timeline-single-post__bottom-control .social-wrap button .icon').not(this).removeClass('clicked');
  
    // Toggle the 'clicked' class on the clicked .icon element
    $(this).toggleClass('clicked');
  
    // Get the count social activation
    var countElement = $(this).siblings('.like-count');
  
    if ($(this).hasClass('clicked')) {
      // Increment the count by 1
      var count = parseInt(countElement.text()) + 1;
      countElement.text(count);
    } else {
      // Reset the count to zero
      countElement.text('0');
    }
  });
  

// ======= Post Top Menu Hide and show
$('.single-item-menu').on('click', function() {
    var postTopMenu = $(this).find('.post-top-menu');
    
    if (postTopMenu.hasClass('show')) {
      postTopMenu.removeClass('show');
      $('.body-overlay').removeClass('everyone-btn-hide');
    } else {
      $('.post-top-menu').removeClass('show');
      $(this).find('.post-top-menu').addClass('show');
      $('.body-overlay').addClass('everyone-btn-hide');
    }
  });
  
  $('.body-overlay').on('click', function() {
    $('.post-top-menu').removeClass('show');
    $('.body-overlay').removeClass('everyone-btn-hide');
  });

$('.single-item-menu').on('click', function() {
    var postTopMenu = $(this).find('.post-top-menu');
  
    if (postTopMenu.length === 0) {
      $(this).append('<ul class="post-top-menu show">' +
                        '<li class="post-top-menu__item">' +
                            '<a class="post-top-menu__link" href="javascript:void(0);">' +
                            '<span class="icon"><i class="fa-solid fa-user-tie"></i></span>' +
                            '<span class="text">Obaydul Vai</span>' +
                            '</a>' +
                        '</li>' +
                        '<li class="post-top-menu__item">' +
                            '<a class="post-top-menu__link" href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#editPostModal">' +
                            '<span class="icon"><i class="fa-solid fa-pen-to-square"></i></span>' +
                            '<span class="text">Edit Post</span>' +
                            '</a>' +
                        '</li>' +
                        '<li class="post-top-menu__item">' +
                            '<a class="post-top-menu__link" href="javascript:void(0);">' +
                            '<span class="icon"><i class="fa-solid fa-trash-can"></i></span>' +
                            '<span class="text">Delete Post</span>' +
                            '</a>' +
                        '</li>' +
                        '<li class="post-top-menu__item">' +
                            '<a class="post-top-menu__link" href="javascript:void(0);">' +
                            '<span class="icon"><i class="fa-regular fa-copy"></i></span>' +
                            '<span class="text">Copy Link</span>' +
                            '</a>' +
                        '</li>' +
                    '</ul>');
    }
  });
  

// Comment modal popup textarea
$('.comment-modal-popup-textarea').on('input', function() {
  var textLength = $(this).val().length;
  var cmtTotalCount = 200;

  $('.cmt-modal-count-start').text(textLength);

  if (textLength > cmtTotalCount) {
      $(this).val($(this).val().substring(0, cmtTotalCount));
      $('.cmt-modal-count-start').text(cmtTotalCount);
  }
});

// when typing for post then  public button disable and enable
$('.comment-modal-popup-textarea').on('input', function() {
if ($(this).val().trim() === '') {
  $('.comment-modal-btn').attr('disabled', 'disabled');
} else {
  $('.comment-modal-btn').removeAttr('disabled');
}
});


// Edit post modal popup textarea
$('.editpost-modal-popup-textarea').on('input', function() {
  var textLength = $(this).val().length;
  var cmtTotalCount = 200;

  $('.editpost-modal-count-start').text(textLength);

  if (textLength > cmtTotalCount) {
      $(this).val($(this).val().substring(0, cmtTotalCount));
      $('.editpost-modal-count-start').text(cmtTotalCount);
  }
});


/*========================= Right Sidebar hover menu show hide ==============*/

// Hide sidebar-user-hover on page load
$('.sidebar-user-hover').hide();

// Append sidebar-user-hover on hover with a delay
$('.sidebar-user-wrap__content-show-auth-info').hover(
    function() {
        var $this = $(this);
        // Check if sidebar-user-hover is not already appended
        if ($this.find('.sidebar-user-hover').length === 0) {
            // Clone and append the sidebar-user-hover element
            var sidebarUserHover = $('.sidebar-user-hover').clone();
            $this.append(sidebarUserHover);
            setTimeout(function() {
                sidebarUserHover.show();
            }, 100); // Show after 1 second
        }
    },
    function() {
        var $this = $(this);
        var sidebarUserHover = $this.find('.sidebar-user-hover');
        // Delay hiding the sidebar-user-hover element by 2 seconds
        setTimeout(function() {
            sidebarUserHover.hide(0, function() {
                $(this).remove();
            });
        }, 100);
    }
);


/*========================= Wallet payment methood chen and un check ==============*/
$(".payment-method-item .icon").hide();
$(".payment-method-item").click(function() {
  // Hide the icon in all payment-method-items
  $(".payment-method-item .icon").hide();
  // Show the icon in the clicked payment-method-item
  $(this).find(".icon").show();
});

/*==================== Sidebar Icon & Overlay js ===============*/
    $(".mobile-responsive-icon").on("click", function() {
        $(".responsive-left-sidebar-wrapper").addClass('show-mobile-sidebar'); 
        $(".sidebar-overlay").addClass('show'); 
        // $(this).toggleClass('show-mobile-sidebar');
    });
    $(".close-hide-show, .sidebar-overlay").on("click", function() {
        $(".responsive-left-sidebar-wrapper").removeClass('show-mobile-sidebar'); 
        $(".sidebar-overlay").removeClass('show'); 
    });


/*================== Odometer Js ==========*/
    if ($(".odometer").length) {
      var odo = $(".odometer");
      odo.each(function () {
        $(this).appear(function () {
          var countNumber = $(this).attr("data-count");
          $(this).html(countNumber);
        });
      });
    }
    
    /*================== Password Show Hide Js ==========*/
    // $(".toggle-password").on('click', function() {
    //   $(this).toggleClass(" fa-eye-slash");
    //   var input = $($(this).attr("id"));
    //   if (input.attr("type") == "password") {
    //   input.attr("type", "text");
    //   } else {
    //   input.attr("type", "password");
    //   }
    // });

$(".toggle-password-change").click(function() {
      var targetId = $(this).data("target");
      var target = $("#" + targetId);
      var icon = $(this);
      if (target.attr("type") === "password") {
          target.attr("type", "text");
          icon.removeClass("fa-eye-slash");
          icon.addClass("fa-eye");
      } else {
          target.attr("type", "password");
          icon.removeClass("fa-eye");
          icon.addClass("fa-eye-slash");
      }
  });




    /*================== Show Login Toggle Js ==========*/
    $('#showlogin').on('click', function () {
      $('#checkout-login').slideToggle(700);
    });

    /*================== Show Coupon Toggle Js ==========*/
    $('#showcupon').on('click', function () {
      $('#coupon-checkout').slideToggle(400);
    });

    /*============** Mgnific Popup **============*/
    $(".image-popup").magnificPopup({
      type: "image",
      gallery: {
          enabled: true,
      },
    });
    
    $('.popup_video').magnificPopup({
        type: 'iframe',
    });



    /* ========================= Latest Slider Js Start ===============*/
    $('.client-slider').slick({
    slidesToShow: 6,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 1000,
    pauseOnHover: true,
    speed: 2000 ,
    dots: false,
    arrows: false,
    prevArrow: '<button type="button" class="slick-prev"><i class="fas fa-long-arrow-alt-left"></i></button>',
    nextArrow: '<button type="button" class="slick-next"><i class="fas fa-long-arrow-alt-right"></i></button>',
    responsive: [
        {
            breakpoint: 1199,
            settings: {
            slidesToShow:6,
            }
        },
        {
            breakpoint: 991,
            settings: {
            slidesToShow: 5
            }
        },
        {
            breakpoint: 767,
            settings: {
            slidesToShow: 4
            }
        },
        {
            breakpoint: 400,
            settings: {
            slidesToShow: 2
            }
        }
        ]
    });

  /*======================= Mouse hover Js Start ============*/
    $('.mousehover-item').on('mouseover', function() {
      $('.mousehover-item').removeClass('active')
      $(this).addClass('active')
    }); 

    /*================== Sidebar Menu Js Start =============== */
    // Sidebar Dropdown Menu Start
    $(".has-dropdown > a").click(function() {
      $(".sidebar-submenu").slideUp(200);
      if (
        $(this)
          .parent()
          .hasClass("active")
      ) {
        $(".has-dropdown").removeClass("active");
        $(this)
          .parent()
          .removeClass("active");
      } else {
        $(".has-dropdown").removeClass("active");
        $(this)
          .next(".sidebar-submenu")
          .slideDown(200);
        $(this)
          .parent()
          .addClass("active");
      }
    });

  
    /*=================== Nice Select Start Js ==================*/
    // $('select').niceSelect();
  
    /*================= Increament & Decreament Js Start ======*/
      const productQty = $(".product-qty");
      productQty.each(function () {
        const qtyIncrement = $(this).find(".product-qty__increment");
        const qtyDecrement = $(this).find(".product-qty__decrement");
        let qtyValue = $(this).find(".product-qty__value");
        qtyIncrement.on("click", function () {
          var oldValue = parseFloat(qtyValue.val());
          var newVal = oldValue + 1;
          qtyValue.val(newVal).trigger("change");
        });
        qtyDecrement.on("click", function () {
          var oldValue = parseFloat(qtyValue.val());
          if (oldValue <= 0) {
            var newVal = oldValue;
          } else {
            var newVal = oldValue - 1;
          }
          qtyValue.val(newVal).trigger("change");
        });
      });

    /*======================= Event Details Like Js Start =======*/
    $('.hit-like').each(function() {
      $(this).on(click(function() {
        $(this).toggleClass('liked')
      }));
    });

    /* ========================= Odometer Counter Js Start ========== */
      $(".counterup-item").each(function () {
        $(this).isInViewport(function (status) {
          if (status === "entered") {
            for (var i = 0; i < document.querySelectorAll(".odometer").length; i++) {
              var el = document.querySelectorAll('.odometer')[i];
              el.innerHTML = el.getAttribute("data-odometer-final");
            }
          }
        });
      });

    /*============** Number Increment Decrement **============*/
      $(".add").on("click", function () {
        if ($(this).prev().val() < 999) {
          $(this)
            .prev()
            .val(+$(this).prev().val() + 1);
        }
      });
      $(".sub").on("click", function () {
        if ($(this).next().val() > 1) {
          if ($(this).next().val() > 1)
            $(this)
            .next()
            .val(+$(this).next().val() - 1);
        }
      });

    /* =================== User Profile Upload Photo Js Start ========== */
    function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              $('#imagePreview').css('background-image', 'url('+e.target.result +')');
              $('#imagePreview').hide();
              $('#imagePreview').fadeIn(650);
          }
          reader.readAsDataURL(input.files[0]);
      }
    }
    $("#imageUpload").change(function() {
      readURL(this);
    });

  });
    /*==========================================
    *      End Document Ready function
    // ==========================================*/

    /*========================= Preloader Js Start =====================*/
        // $(window).on("load", function(){
        //   $('.preloader').fadeOut(); 
        // })
        $(window).on("load", function(){
        $("#loading").fadeOut();
        })

 
    
    /*============================ Scroll To Top Icon Js Start =========*/
    var btn = $('.scroll-top');

    $(window).scroll(function() {
      if ($(window).scrollTop() > 300) {
        btn.addClass('show');
      } else {
        btn.removeClass('show');
      }
    });

    btn.on('click', function(e) {
      e.preventDefault();
      $('html, body').animate({scrollTop:0}, '300');

    });

    /*============================ Header Search =========*/

    $('.header-search-icon').on('click', function() {
        $('.header-search-hide-show').addClass('show');
        $('.header-search-icon').hide();
        $('.close-hide-show').addClass('show');
    });

    $('.close-hide-show').on('click', function() {
        $('.close-hide-show').removeClass('show');
        $('.header-search-hide-show').removeClass('show');
        $('.header-search-icon').show();
    });


    /*=========================  Light and dark Start =================*/
    var mode = localStorage.getItem("mode") || "light";
    if (mode === "dark") {
      $("body").addClass("dark");
      $(".normal-logo").addClass("hidden");
      $(".dark-logo").removeClass("hidden");
      $("#footer-logo-normal").addClass("hidden");
      $("#footer-logo-dark").removeClass("hidden");
    }
    $("#light-dark-checkbox").click(function() {
      if (mode === "light") {
        mode = "dark";
        $("body").addClass("dark");
        $(".normal-logo").addClass("hidden");
        $(".dark-logo").removeClass("hidden");
        $("#footer-logo-normal").addClass("hidden");
        $("#footer-logo-dark").removeClass("hidden");
      } else {
        mode = "light";
        $("body").removeClass("dark");
        $(".dark-logo").addClass("hidden");
        $(".normal-logo").removeClass("hidden");
        $("#footer-logo-dark").addClass("hidden");
        $("#footer-logo-normal").removeClass("hidden");
      }
    localStorage.setItem("mode", mode);
    });
    /* === dark and light icon handle with local storage ===*/
    $('.mon-icon').on('click', function() {
    $(this).addClass('show');
    $('.sun-icon').addClass('show');
    localStorage.setItem('mode', 'dark');
    });

    $('.sun-icon').on('click', function() {
    $(this).removeClass('show');
    $('.mon-icon').removeClass('show');
    localStorage.setItem('mode', 'light');
    });

    /*=== On page load, check the stored mode and apply it ===*/
    $(document).ready(function() {
    var mode = localStorage.getItem('mode');
    if (mode === 'dark') {
        $('.mon-icon').addClass('show');
        $('.sun-icon').addClass('show');
    } else {
        $('.mon-icon').removeClass('show');
        $('.sun-icon').removeClass('show');
    }
    });

    /*============================ header menu show hide =========*/
    $('.sidebar-menu-show-hide').on('click', function() {
        $('.sidebar-menu-wrapper').addClass('show');
        $(".sidebar-overlay").addClass('show'); 
    });

    $('.sidebar-overlay, .close-hide-show').on('click', function() {
        $('.sidebar-menu-wrapper').removeClass('show');
        $(".sidebar-overlay").removeClass('show'); 
    });
      
  

})(jQuery);



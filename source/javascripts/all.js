//= require jquery
//= require bootstrap-sprockets
//= require_tree .
<!-- navbarscroll -->

$(document).ready(function() {
  // navbar transition jQuery script
  $(window).scroll(function(e){
    if ($(this).scrollTop() > 60) {
      $(".navbar").css({
        "background": "rgb(255,200,54)",
        "box-shadow": "0 0 2px"
      });
    }
    else {
      $(".navbar").css({
        "background": "transparent",
        "box-shadow": "0 0 0px transparent"
      });
    }
  });
});

<!-- smoothscroll -->
$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
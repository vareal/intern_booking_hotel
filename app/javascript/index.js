document.addEventListener("turbolinks:load", function() {
  $(document).ready(function(){
    $('.slick-list').slick({
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: false,
      dots: true
    });

    $('.gallery').slick({
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: true,
      dots: true
    });
  });
})

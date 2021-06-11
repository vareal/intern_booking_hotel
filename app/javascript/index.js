document.addEventListener("turbolinks:load", function() {
  $(document).ready(function(){
    $('.slick-list').slick({
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: false,
      dots: true
    });

    $('.list-images-for-room').slick({
      arrows: true,
    });
  });
})

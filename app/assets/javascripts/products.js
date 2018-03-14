// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
	$("#cart").hide();
    $(".buttonAdd").click(function(){
      $('.btnTog').text('Close Purchase List');
        $('#cart').slideDown();
        if(!$('#cart').hasClass('opened')){
          if ($('.btnTog').length){
            $("body").css({"overflow-y": "hidden"});
          }
        }
    });
});






$(function() { 
$(".buttonAdd").click(function(){
 if ($('#cart tr').length == 1) {
  $("HTML, BODY").animate({
      scrollTop: 0
        }, 1000);
  $("html, body").bind("scroll mousedown DOMMouseScroll mousewheel keyup touchmove", function(){
      $('html, body').stop();
  });
}
});
});

 $(document).ready(function() {
    if ($('#cart tr').length > 1) {
      $(".productMainInfo").css({"margin-top": "20px"});
    }
 });






 $(document).ready(function() {
    $('#cart').hide(); 
    $('#cart').addClass('closed');
  $('.btnTog' ).click(function() {
    $("body").css({"overflow-y": "hidden"});
    if(!$('#cart').hasClass('opened')){
      $('#cart').slideUp(function(){$(this).addClass('closed').removeClass('opened')});
      $("body").css({"overflow-y": "auto"});
      $('.btnTog').text('Open Purchase List');

    }
    else{
      $('#cart').slideDown(function(){$(this).removeClass('closed').addClass('opened')});
        $("body").css({"overflow-y": "hidden"});
        $('.btnTog').text('Close Purchase List');
    }
   
   });
 });





  $(document).ready(function() {
    $('#productComments').hide();  
  $('.productCommentsBtn').click(function() {
    if(!$('#productComments').hasClass('opened')){
      $('#productComments').slideUp(function(){$(this).addClass('opened')});
      if($(window).width() > 767){
        $(".comments").css({"margin-bottom": "5em"});
      }
        
    }
    else{
      $('#productComments').slideDown(function(){$(this).removeClass('opened')});
      if($(window).width() > 767){
        $(".comments").css({"margin-bottom": "10em"});
      }
    }
   
   });
 });



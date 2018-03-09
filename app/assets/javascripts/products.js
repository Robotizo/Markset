// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
	$("#cart").hide();
    $(".buttonAdd").click(function(){
      if ($('#cart tr').length == 1){
        $("body").css({"overflow-y": "scroll"});
      }
      else{
        $("body").css({"overflow-y": "hidden"});
      }
        
        $("#cart").slideDown("fast");
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
      $(".productMainInfo").css({"margin-top": "50px"});
    }
 });






 $(document).ready(function() {
    $('#cart').hide(); 
  $('.btnTog' ).click(function() {
    $("body").css({"overflow-y": "hidden"});
    if(!$('#cart').hasClass('opened')){
      $('#cart').slideUp(function(){$(this).addClass('closed').removeClass('opened')});
      $("body").css({"overflow-y": "auto"});

    }
    else{
      $('#cart').slideDown(function(){$(this).removeClass('closed').addClass('opened')});
       $("body").css({"overflow-y": "hidden"});
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



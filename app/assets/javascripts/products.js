// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
	$("#cart").hide();
    $(".buttonAdd").click(function(){
        $("#cart").slideDown("fast");
    });
});




 $(document).ready(function() {
    $('#cart').hide(); 
  $('.btnTog').click(function() {
    if(!$('#cart').hasClass('opened')){
      $('#cart').slideUp(function(){$(this).addClass('opened')});
    }
    else{
      $('#cart').slideDown(function(){$(this).removeClass('opened')});
    }
   
   });
 });



 $(document).ready(function() {
    $('#productComments').hide(); 
  $('.productCommentsBtnShow').click(function() {
   $('#productComments').slideDown();
   });
 });

 $(document).ready(function() {
  $('.productCommentsBtnHide').click(function() {
   $('#productComments').slideUp();
   });
 });

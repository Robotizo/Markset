// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
	$("#cart").hide();
    $(".btnTog2").click(function(){
        $("#cart").slideDown("swing");
    });
    $(".buttonAdd").click(function(){
        $("#cart").slideDown("fast");
    });
});

$(function(){
    $(".btnTog").click(function(){
        $("#cart").slideUp("swing");
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

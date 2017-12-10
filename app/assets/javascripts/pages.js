// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
	$("#posts").hide();
    $(".btn1").click(function(){
        $("#posts").load("/pages/"+id+"/ #products");
    });
});


$(document).ready(function(){
    $(".btn2").click(function(){
        $("#products").load("/pages/"+id+"/ #posts");

    });
});


 $(document).ready(function() {
    $('#pageTimes').hide(); 
  $('.btnStore').click(function() {
   $('#pageTimes').slideToggle();
   });
 });



 $(document).ready(function() {
    $('.descriptionMob').hide(); 
  $('.btnDescription').click(function() {
    if(!$('.descriptionMob').hasClass('opened')){
      $('.descriptionMob').slideUp(function(){$(this).addClass('opened')});
    }
    else{
      $('.descriptionMob').slideDown(function(){$(this).removeClass('opened')});
    }
   
   });
 });

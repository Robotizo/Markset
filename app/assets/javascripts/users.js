// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
	$("#pagesPanel").hide();
    $(".btn1").click(function(){
        $("#pagesPanel").load("/users/"+id+"/ #overview");
    });
});


$(document).ready(function(){
    $(".btn2").click(function(){
        $("#overview").load("/users/"+id+"/ #pagesPanel");
    });
});



 $(document).ready(function() {
 	$('#passChange').hide(); 
  $('.btn4').click(function() {
   $('#passChange').slideToggle();
   });
 });

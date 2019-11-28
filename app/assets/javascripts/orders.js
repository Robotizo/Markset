// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
	$(".cardPayment").hide();
    $(".btnCard").click(function(){
        $(".cardPayment").show();
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




$(document).ready(function(){
  $(".ordersDelBox option[value='Pick-Up']").remove();
});


$(document).ready(function(){
  $(".ordersPUBox option[value='Delivery']").remove();
});
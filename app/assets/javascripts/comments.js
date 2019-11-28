// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function() { 
 if ($(".commentSection").length > 0) {
	var commentSection = $('.commentSection').offset().top;
	$("HTML, BODY").animate({
    	scrollTop: commentSection
        }, 1000);
	$("html, body").bind("scroll mousedown DOMMouseScroll mousewheel keyup touchmove", function(){
    	$('html, body').stop();
	});
}
});



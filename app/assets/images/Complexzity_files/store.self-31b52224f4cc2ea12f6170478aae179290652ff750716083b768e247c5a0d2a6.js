//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/


var slidePos = 1;
slidesShowcase(slidePos);

function addSlides(n) {
  slidesShowcase(slidePos += n);
}

function currentSlide(n) {
  slidesShowcase(slidePos = n);
}

function slidesShowcase(n) {
  var i;
  var slides = document.getElementsByClassName("theSlides");
  if (n > slides.length) {slidePos = 1}    
  if (n < 1) {
    slidePos = slides.length
  }
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  slides[slidePos-1].style.display = "block"; 
    
}


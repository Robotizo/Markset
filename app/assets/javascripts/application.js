// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( function() {
    $( "#tags" ).autocomplete({
      source: productNames,
        select: function(event, ui) {
            $(event.target).val(ui.item.value);
            $('.magSub').click();
        }
        
    });
    productNames.sort();
});


$(document).ready(function(){
    $(".btn7").click(function(){
        $('search').submit();
    });
});

function reload() {
    location.reload();
}


function bottomNavFuncIn() {
    var trigger = document.getElementById("bottomnavjs");
    if (trigger.className === "bottomnavIn") {
        trigger.className += " respond";
    } 
    else {
        trigger.className = "bottomnavIn";
    }
}

function bottomNavFuncOut() {
    var trigger = document.getElementById("bottomnavjs");
    if (trigger.className === "bottomnavOut") {
        trigger.className += " respond";
    } 
    else {
        trigger.className = "bottomnavOut";
    }
}

function dropDown() {
    document.getElementById("mainDropdown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
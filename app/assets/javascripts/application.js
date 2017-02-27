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
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {
  testLive;
});


var startLive = window.setInterval(
     function(){
       $.ajax({
         method: "GET",
         url: "/users/:user_id/polls/:id"
       })
       .done(function(response){
         $("#questions-homepage").replaceWith(response);
       });

      //  $(document).css("background-color","black");
     },
     10000  /* 10000 ms = 10 sec */
);

// var testLive = window.setInterval(function(){
//   console.log('CHRIS');
//   },
//   1000
// );

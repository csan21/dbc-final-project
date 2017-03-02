$(document).ready(function() {
  if ($("#dashboard").length){
    var pollRefresh = setInterval(function(){
      $.get(window.location.pathname + '/polls_to_answer')
      .done(function(response){
        // debugger
          $(".need").html(response)
      });
    },
    1000  /* 10000 ms = 10 sec */
    );
  }
});

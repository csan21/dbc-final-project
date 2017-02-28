$(document).ready(function() {
  var voteRefresh = setInterval(function(){
    $.ajax({
     method: "GET",
     url: window.location.pathname
    })
    .done(function(response){
      console.log(response)
      $('#poll-votes').html(response)
    });
   },
   1000  /* 10000 ms = 10 sec */
  );
});

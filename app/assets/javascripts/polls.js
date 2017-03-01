$(document).ready(function() {

  if ($('.poll-page').length){

    moment.updateLocale('en', {
    relativeTime : {
        future: "in %s",
        past:   "%s ago",
        s:  "seconds",
        m:  "a minute",
        mm: "%d minutes",
        h:  "an hour",
        hh: "%d hours",
        d:  "a day",
        dd: "%d days",
        M:  "a month",
        MM: "%d months",
        y:  "a year",
        yy: "%d years"
    }
});

    var voteRefresh = setInterval(function(){
      $.ajax({
      method: "GET",
      url: window.location.pathname
      })
      .done(function(response){
        $('#poll-votes').html(response)
      });

      updateExpirationTimer(expiresAt);
    },
    1000  /* 1000 ms = 1 sec */
    );

    $("#new_poll btn").on('click', function(event){
      $(this).button('toggle');
    })

    if ($('#poll-votes-swipe').length > 0){
      var myElement = document.getElementById('poll-votes-swipe')

      var hammertime = new Hammer(myElement);

      hammertime.on('swipeleft', function(ev) {
        console.log('swipeleft');
        $.ajax({
          method: "POST",
          url: $('#poll-answer-left').find('form').attr('action')
        })
      });

    hammertime.on('swiperight', function(ev) {
      console.log('swiperight');
      $.ajax({
        method: "POST",
        url: $('#poll-answer-right').find('form').attr('action')
        })
      });
    };

    var pollId = window.location.pathname.split('/').pop();
    var url = "/polls/" + pollId + "/expiration";
    res = $.get(url);

    res.done(function (response){
      expiresAt = moment(response);
    });
  };
});

var updateExpirationTimer = function(expirationMoment){
  var expirationMessage;
  if ( moment().isBefore(expirationMoment)){
    expirationMessage = expirationMoment.countdown().toString();
    expirationMessage += " left to vote";
  } else {
    expirationMessage = "Poll finished " + expirationMoment.fromNow();
  }
  $("#poll-timer").text(expirationMessage);
}

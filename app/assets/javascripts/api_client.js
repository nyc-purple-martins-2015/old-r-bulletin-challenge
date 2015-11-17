$(document).ready(function() {

    $('#api-content').on('click', '.topic-link', function(event){
      event.preventDefault();
      var topicId = event.target.dataset.topicId;
      $.get('/api/topics/' + topicId).done(function(serverResponse){
        var locals  = { topic: serverResponse }
        var templateSource   = $("#topic-detail").html();
        var template = Handlebars.compile(templateSource);
        var output = template(locals);
        $('div#api-content').html(output);
      });
    });

    function placeTopics(topics) {
      var locals  = { topicList: topics }
      var templateSource   = $("#topic-template").html();
      var template = Handlebars.compile(templateSource);
      var output = template(locals);
      $('div#api-content').html(output);
    }

    if($('#api-content').length) {
      var deferred = $.get('/api/topics');
      deferred.done(function(serverResponse){
        placeTopics(serverResponse);
      });

    }




});



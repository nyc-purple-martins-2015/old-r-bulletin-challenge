// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $(".new_conversation").on("submit", function(event){
    event.preventDefault();
    var postRoute = $(this).attr("action");
    var convoList = $(".convo_list");
    var newConvoData = $(this).serialize();
    var newConvoRequest = $.ajax({
      method: 'post',
      url: postRoute,
      data: newConvoData
    });
    newConvoRequest.done(function(newConvoListItem){
      convoList.prepend(newConvoListItem);
      $(".new_conversation").find("input[type=text]").val("");
    });
  });

  $(".get_new_message_form").on('click', function(event) {
    event.preventDefault();
    $(".get_new_message_form").hide();
    $(".new_message_form").fadeToggle();
  });

  $(".new_message").on("submit", function(event) {
    event.preventDefault();
    var postRoute = $(this).attr("action");
    var messageList = $(".convo_message_list");
    var newMessageData = $(this).serialize();
    var newMessageRequest = $.ajax({
      method: 'post',
      url: postRoute,
      data: newMessageData
    });
    newMessageRequest.done(function(newMessageItem) {
      messageList.prepend(newMessageItem);
      $('.new_message').find("textarea").val("");
      $(".new_message_form").toggle();
      $(".get_new_message_form").show();
    });
  });

})

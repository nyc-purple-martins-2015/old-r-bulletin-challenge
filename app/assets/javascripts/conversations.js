// $(document).ready(function(){

//   $(".new-message-link").on("click", function(event){
//     event.preventDefault();
//     var url = $(this).children().attr("href");

//     var request = $.ajax({
//       method: "get",
//       url: url,
//     }).done(function(form){
//       var new_message_form = $(form).children().last();
//       $(".new-message-link").replaceWith(new_message_form)
//     });
//   });

//   $(".new-conversation-link").on("click", function(event){
//     event.preventDefault();
//     var url = $(this).children().attr("href");

//     var request = $.ajax({
//       method: "get",
//       url: url,
//     });

//     request.done(function(form){
//       var new_conv_form = $(form).children().last();
//       $(".new-conversation-link").replaceWith(new_conv_form)
//     });
//   });
// });

$(document).ready(function() {
  $("#create-survey").on("submit",function(event){
    event.preventDefault();

    var requestOption = {
      url: $(event.target).attr("action"),
      method: "POST",
      data: $(event.target).serialize(),
      dataType: "html"
    };

    $.ajax(requestOption).done(function(response){

      $("#created-question").append(response)
    }).fail(function(response){
      console.log(response)
    });
  });

   $("#created-question").on('submit', 'form', function(event){
    event.preventDefault();
    console.log($(event.target))
      // debugger

    var requestOption = {
      url: $(event.target).attr("action"),
      method: $(event.target).attr("method"),
      data: $(event.target).serialize(),
      dataType: "html"
    };

    $.ajax(requestOption).done(function(response){
      console.log('helllooowwww')
      $('#created-choice').append(response)
    }).fail(function(response){
      console.log('you failed!!!!')
    });
   });

});


  // $(".post-vote-button").on("click", function(event){
  //   event.preventDefault();
  //   var post_id = Number($(event.target).attr("post-id"));
  //   var requestOption = {
  //     url: "/postvote",
  //     method: "POST",
  //     data: {post_id: post_id},
  //     datatype: "html"
  //   };
  //   $.ajax(requestOption).done(function(response){
  //     $(event.target).hide();
  //     $("span[post-id='" + post_id + "']").html(response);
  //   }).done(function(response){
  //     console.log(response);
  //   });
  // });

  //   $(".comment-vote-button").on("click", function(event){
  //   event.preventDefault();
  //   var comment_id = Number($(event.target).attr("comment-id"));
  //   var requestOption = {
  //     url: "/commentvote",
  //     method: "POST",
  //     data: {comment_id: comment_id},
  //     datatype: "html"
  //   };
  //   $.ajax(requestOption).done(function(response){
  //     $(event.target).hide();
  //     $("span[comment-id='" + comment_id + "']").html(response);
  //   }).done(function(response){
  //     console.log(response);
  //   });
  // });

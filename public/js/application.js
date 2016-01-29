$(document).ready(function() {

  $(".post-vote-button").on("click", function(event){
    event.preventDefault();
    var post_id = Number($(event.target).attr("post-id"));
    var requestOption = {
      url: "/postvote",
      method: "POST",
      data: {post_id: post_id},
      datatype: "html"
    };
    $.ajax(requestOption).done(function(response){
      $(event.target).hide();
      $("span[post-id='" + post_id + "']").html(response);
    }).done(function(response){
      console.log(response);
    });
  });

    $(".comment-vote-button").on("click", function(event){
    event.preventDefault();
    var comment_id = Number($(event.target).attr("comment-id"));
    var requestOption = {
      url: "/commentvote",
      method: "POST",
      data: {comment_id: comment_id},
      datatype: "html"
    };
    $.ajax(requestOption).done(function(response){
      $(event.target).hide();
      $("span[comment-id='" + comment_id + "']").html(response);
    }).done(function(response){
      console.log(response);
    });
  });

});

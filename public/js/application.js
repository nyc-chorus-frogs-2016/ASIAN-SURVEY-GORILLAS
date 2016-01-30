$(document).ready(function() {

  $("#survey-form").on("submit",function(event){
    event.preventDefault();
    var requestOption = {
      url: $(event.target).attr("action"),
      method: "POST",
      data: $(event.target).serialize(),
    };
    $.ajax(requestOption).done(function(response){
      $("#survey-div").html(response);
    }).fail(function(response){
      console.log(response);
    });
  });

  $("#survey-div").on('click', '#add-question-button', function(event){
    event.preventDefault();
    var requestOption = {
      url: "/surveys/" + $("#add-question-button").attr("survey_id") + "/questions/new"
    };
    $.ajax(requestOption).done(function(response){
      $("#question-div").html(response);
    }).fail(function(response){
      console.log(response);
    });
  });

  $("#question-div").on('submit', "form#question-form", function(event){
    event.preventDefault();
    var requestOption = {
      url: "/surveys/29/questions",
      method: "POST",
      data: $(event.target).serialize()
    };
    $.ajax(requestOption).done(function(response){
      $("#question-div").empty();
      $("#questions").append(response);
    }).fail(function(response){
      console.log(response);
    });
  });



});

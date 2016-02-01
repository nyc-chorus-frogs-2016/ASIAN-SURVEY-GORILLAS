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
      url: $(event.target).attr("action"),
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


  $("#questions").on('click', "#add-choice-button", function(event){
    event.preventDefault();
    var requestOption = {
      url: "/questions/" + $(event.target).attr("question_id") + "/choices/new",
    };
    $.ajax(requestOption).done(function(response){
      $("#questions div[question_id=" + $(event.target).attr("question_id") + "]").append(response);
    }).fail(function(response){
      console.log(response);
    });
  });

  $("#questions").on('submit', "form#choice-form", function(event){
    event.preventDefault();
    var requestOption = {
      url: $(event.target).attr("action"),
      method: "POST",
      data: $(event.target).serialize()
    };

    $.ajax(requestOption).done(function(response){
        $("form#choice-form").remove();
        $("#questions div[question_id=" + $(event.target).attr("question_id") + "]").append(response);
    }).fail(function(response){
      console.log(response);
    });
  });




});

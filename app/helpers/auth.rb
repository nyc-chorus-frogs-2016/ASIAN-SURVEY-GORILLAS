
def logged_in?
  !!session[:user_id] && current_user
end

def current_user
  User.find_by(id: session[:user_id])
end

def current_user_id
  if logged_in?
    current_user.id
  end
end

def find_survey_id(question)
  id = question.question_surveys[0].survey_id
  id
end

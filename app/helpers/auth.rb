
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


    def most_chosen(question)
    lists = {}
    question.choices.each do |choice|
      lists[choice.content] = choice.answers.count
    end
   lists.select {|k,v| v == lists.values.max }
# lists.each { |k, v| puts k.content if v == lists.values.max }
  end

def answered_all?(user, survey)
  answers = []
  Answer.find_each do |answer|
  if answer.taker_id == user.id && answer.survey_id == survey.id
answers << answer
end
end
# binding.pry
if answers != nil

# binding.pry
return true if answers.count == survey.questions.count
end
end


def votedchoice(user, choice)
answer = Answer.find_by(taker_id: user.id, choice_id: choice.id)
if answer != nil
  return true
else
  false
end
end

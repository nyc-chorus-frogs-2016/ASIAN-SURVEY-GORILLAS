
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

# def find_creator(choice)
#   choice.question.survey_id.creator_id
# end

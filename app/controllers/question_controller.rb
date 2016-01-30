#create a question
get '/surveys/:id/questions/new'  do
  @survey = Survey.find_by(id: params[:id])
  erb :'questions/new'
end

post '/surveys/:id/questions' do
  p'asdfdasf'
  @survey = Survey.find_by(id: params[:id])
  question = Question.new(params[:question])
  if question.save
    if request.xhr?
      erb :'_choices_form', layout: false, locals: {question: question}

    else
    redirect "/questions/#{question.id}/choices/new"
  end
    @survey.questions << question
  else
    @errors = "Please fill out all fields"
    erb :'questions/new'
  end
end

#edit
get '/questions/:id/edit' do
   @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

# update
put '/questions/:id/edit' do
  question = Question.find_by(id: params[:id])
  question.update_attributes(params[:question])
  redirect "/surveys/#{find_survey_id(question)}"
end


#delete
delete '/questions/:id' do
  question = Question.find_by(id: params[:id])
  question.destroy
  redirect "/surveys/#{find_survey_id(question)}"
end

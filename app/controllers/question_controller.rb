#create a question
get '/surveys/:id/questions/new'  do
  @survey = Survey.find_by(id: params[:id])
  if request.xhr?
    erb :"_question_form", layout: false, locals: {survey: @survey}
  else
    erb :'questions/new'
  end
end

get '/surveys/:id'  do
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end


post '/surveys/:id/questions' do
  @survey = Survey.find_by(id: params[:id])
  # question = Question.new(params[:question])
  question = Question.new(params[:question])
  if question.save
    @survey.questions << question
    if request.xhr?
      erb :'_question_description', layout: false, locals: {question: question}
    else
    redirect "/surveys/#{@survey.id}"
    end
  else
    @errors = "Please fill out all fields"
    erb :'questions/new'
  end
end


get '/questions/show' do
@questions = Question.all
erb :'questions/show'
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

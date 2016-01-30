get '/questions/:id/choices/new' do
 @question = Question.find_by(id: params[:id])
 if request.xhr?
  erb :"_choices_form", layout: false, locals: {question: @question}
 else
  erb :"choices/new"
 end
end

post '/questions/:id/choices' do
  @question = Question.find_by(id: params[:id])
  choice = Choice.new(params[:choice])
  if choice.save
    @question.choices << choice
    if request.xhr?
      erb :"_choices_description", layout: false, locals: {choice: choice}
    else
      redirect "surveys/#{find_survey_id(@question)}/questions/new"
    end
  else
    @errors = "Please fill out all fields"
    erb :'choices/new'
  end
end


#edit
get '/choices/:id/edit' do
   @choice = Choice.find_by(id: params[:id])
  erb :'choices/edit'
end

# update
put '/choices/:id/edit' do
  choice = Choice.find_by(id: params[:id])
  choice.update_attributes(params[:choice])
  redirect "/surveys/#{find_survey_id(choice.question)}"
end


#delete
delete '/choices/:id' do
  choice = Choice.find_by(id: params[:id])
  choice.destroy
  redirect "/surveys/#{find_survey_id(choice.question)}"
end

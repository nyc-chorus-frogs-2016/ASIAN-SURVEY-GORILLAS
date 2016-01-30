get '/questions/:id/choices/new' do
 @question = Question.find_by(id: params[:id])
 erb :"choices/new"
end

post '/questions/:id/choices' do
  @question = Question.find_by(id: params[:id])
  choice = Choice.new(params[:choice])
  if choice.save
    @question.choices << choice
    redirect "surveys/#{find_survey_id(@question)}/questions/new"

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

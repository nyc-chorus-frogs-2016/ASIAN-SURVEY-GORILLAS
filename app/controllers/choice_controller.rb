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
      redirect "surveys/#{find_survey_id(@question)}"
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

delete '/choices/:id/delete' do
  choice = Choice.find_by(id: params[:id])
  userID = User.find_by(id: params[:user][:taker_id])
answer = Answer.find_by(taker_id: userID, choice_id: choice.id)
answer.destroy
redirect "surveys/#{find_survey_id(choice.question)}"
end




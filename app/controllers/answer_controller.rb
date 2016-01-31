post '/answers' do
  answer = Answer.new(params[:answer])
  # binding.pry
  if answer.save
    redirect "/surveys/#{answer.survey_id}"
  else
   @survey = Survey.find_by(id: answer.survey_id)
    @error = "!!!!!!you already voted for this question!!!!!!"
    erb :"surveys/show"
  end
end


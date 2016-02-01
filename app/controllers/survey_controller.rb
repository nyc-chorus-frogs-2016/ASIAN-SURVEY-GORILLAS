get '/' do
  @surveys = Survey.all
  erb :'surveys/index'
end

#create a new survey
get '/surveys/new'  do
  erb :'surveys/new'
end


#show a survey
get '/surveys/:id'  do
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end

get '/users/:id/results' do
@user = User.find_by(id: params[:id])
@surveys = @user.surveys
erb :'surveys/result'
end

post '/surveys'  do
  new_survey = Survey.new(params[:survey])

  if new_survey.save
    if request.xhr?
      erb :'_survey_description', layout: false, locals: {survey: new_survey}
    else
      redirect "/surveys/#{new_survey.id}/questions/new"
    end
  else
    @errors = new_survey.errors.full_messages
    erb :'surveys/new'
  end
end




#edit
get '/surveys/:id/edit' do
   @survey = Survey.find_by(id: params[:id])
  erb :'surveys/edit'
end

#update
put '/surveys/:id/edit' do
  survey = Survey.find_by(id: params[:id])
  survey.update_attributes(params[:survey])
  redirect "/surveys/#{survey.id}"
end

put '/surveys/:id/active' do
  survey = Survey.find_by(id: params[:id])
  survey.update_attributes(params[:survey])
  redirect "/surveys/#{survey.id}"
end

#delete
delete '/surveys/:id' do
  survey = Survey.find_by(id: params[:id])
  survey.destroy
  redirect "/"
end

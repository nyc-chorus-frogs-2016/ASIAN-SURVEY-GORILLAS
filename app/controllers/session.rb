get '/login' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.find_by(username:params[:user][:username])
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/'
  else
    @error = 'User does not exist, please register'
    erb :'sessions/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

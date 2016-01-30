get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'/users/index'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    # redirect "/users/#{@user.id}"
    redirect '/'
  else
    @error = "please fill out all blanks"
    erb :'/sessions/new'
  end
end



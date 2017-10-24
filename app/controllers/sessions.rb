  #--Render login page--#
get '/sessions/new' do
  erb :"sessions/new"
end

  #--Ask database if the user exists and provided a valid password--#
post '/sessions' do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Either your email or password was wrong"]
    erb :"sessions/new"
  end
end

  #--Upon user logout, delete the session and redirect to homepage--#
delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end

  #--Render unauthorized page--#
get '/not_authorized' do
  erb :not_authorized
end

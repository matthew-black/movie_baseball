  #--Render a register user page--#
get '/users/new' do
  @user = User.new
  erb :"users/new"
end

  #--Send info from registration to database--#
post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

  #--Display an individual user--#
get '/users/:id' do
  authenticate!
  @user = User.find_by(id: params[:id])
  authorize!(@user)
  erb :"users/show"
end

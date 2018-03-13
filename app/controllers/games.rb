#   #--Display all of the things--#
# get '/things' do
#   erb :"/things/index"
# end

#   #--Render form for making a new thing--#
# get '/things/new' do
#   authenticate!
#   erb :"/things/new"
# end

  #--Create a new thing--#
post '/games' do
  @game = Game.create(score: 0, user_id: current_user_id)
  session[:game_id] = @game.id
  movie_id = Movie.fetch_popular_movie_id
  @movie = Movie.new(movie_id)
  used_movie = UsedMovie.create(title: @movie.title, tmdb_id: @movie.id, game_id: @game.id)
  @game.used_movies << used_movie
  puts "****************"
  p session

  if request.xhr?
    erb :"movies/_show", layout: false
  else
    redirect "/"
  end
end

#   #--Display an individual thing--#
# get '/things/:id' do
#   @thing = find_and_ensure(params[:id])
#   erb :"/things/show"
# end

#   #--Render a form to edit a thing--#
# get '/things/:id/edit' do
#   @thing = find_and_ensure(params[:id])
#   authenticate!
#   authorize!(@thing.owner)
#   erb :"/things/edit"
# end

#   #--Update a thing--#
# put '/things/:id' do
#   @thing = find_and_ensure(params[:id])
#   authenticate!
#   authorize!(@thing.owner)
#   @thing.assign_attributes(params[:thing])

#   if @thing.save
#     redirect "/things/#{params[:id]}"
#   else
#     @errors = @thing.errors.full_messages
#     erb :'things/edit'
#   end
# end

#   #--Delete a thing--#
# delete '/things/:id' do
#   @thing = find_and_ensure(params[:id])
#   authenticate!
#   authorize!(@thing.owner)
#   @thing.destroy
#   redirect '/things'
# end

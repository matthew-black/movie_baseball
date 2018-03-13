post '/movies' do
  if request.xhr?
    @game = Game.find(session[:game_id])
    found_id = Movie.fetch_movie_id(params[:movie])
    if found_id
      @movie = Movie.new(found_id)
      erb :"movies/_show", layout: false
    else
      puts "lolol for now..."
      puts "predictive search bar should ensure valid input"
      puts "you'll still need to deal with invalid input tho, dummy."
    end
  end
end
post '/actors' do
  if request.xhr?
    @game = Game.find(session[:game_id])
    found_id = Actor.fetch_actor_id(params[:actor])
    if found_id
      @actor = Actor.new(found_id)
      erb :"actors/_show", layout: false
    else
      puts "lolol for now..."
      puts "predictive search bar should ensure valid input"
      puts "you'll still need to deal with invalid input tho, dummy."
    end
  end
end



# require 'themoviedb-api'

class Movie
  attr_reader :id, :title, :image, :cast

  def initialize(id)
    @id    = id
    @title = Tmdb::Movie.detail(id).title
    @image = "http://image.tmdb.org/t/p/w300" + Tmdb::Movie.posters(id)[0].file_path
    @cast  = Tmdb::Movie.cast(id).map do |actor|
      {id: actor.id, name: actor.name}
    end
  end

  def self.fetch_popular_movie_id
    Tmdb::Movie.popular.results.sample.id
  end

end

# <ul>
#   <% @movie.cast.each do |actor| %>
#     <li><%= actor[:name] %></li>
#   <% end %>
# </ul>
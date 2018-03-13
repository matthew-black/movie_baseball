
class Movie
  attr_reader :id, :title, :image, :cast

  def initialize(id)
    @id    = id
    @title = Tmdb::Movie.detail(id).title
    @image = "http://image.tmdb.org/t/p/w300" + Tmdb::Movie.posters(id).sample.file_path
    @cast  = Tmdb::Movie.cast(id).map do |actor|
      {actor.id => actor.name}
    end
  end

  def self.fetch_popular_movie_id
    # Tmdb::Movie.popular.results.sample.id
    random_year = rand(2006..2012)
    random_movies = Tmdb::Discover.movie(primary_release_year: random_year, sort_by: 'revenue.desc')

    random_movies.results.sample.id
  end

  def self.fetch_movie_id(movie_to_find)
    begin
      Tmdb::Search.movie(movie_to_find).results.first.id
    rescue
      return nil
    end
  end

end

# <ul>
#   <% @movie.cast.each do |actor| %>
#     <li><%= actor[:name] %></li>
#   <% end %>
# </ul>
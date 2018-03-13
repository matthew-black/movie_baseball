class Actor
  attr_reader :name, :image, :credits

  def initialize(id)
    @id      = id
    @name    = Tmdb::Person.detail(id).name
    @image   = "http://image.tmdb.org/t/p/w300" + Tmdb::Person.images(id).profiles.sample.file_path
    @credits = Tmdb::Person.movie_credits(id).cast.map do |movie|
      { movie.id => movie.title }
    end
  end

  def self.fetch_actor_id(actor_to_find)
    begin
      Tmdb::Search.person(actor_to_find).results.first.id
    rescue
      return nil
    end
  end



end

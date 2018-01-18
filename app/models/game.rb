class Game < ActiveRecord::Base

  belongs_to :user
  has_many :used_movies
  has_many :used_actors

end
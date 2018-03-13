class UsedMovie < ApplicationRecord
  attr_reader :title, :tmdb_id, :game_id

  belongs_to :game

  # def initialize(title, tmdb_id, game_id)
  #   @title = title
  #   @tmdb_id = tmdb_id
  #   @game_id = game_id
  # end

end


# class CreateUsedMovies < ActiveRecord::Migration[5.1]
#   def change
#     create_table :used_movies do |t|
#       t.string :title, null: false
#       t.integer :tmdb_id, null: false
#       t.integer :game_id, null: false

#       t.timestamps
#     end
#   end
# end
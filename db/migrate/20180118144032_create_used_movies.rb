class CreateUsedMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :used_movies do |t|
      t.string :title, null: false
      t.integer :tmdb_id
      t.integer :game_id

      t.timestamps
    end
  end
end
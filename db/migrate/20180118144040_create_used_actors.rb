class CreateUsedActors < ActiveRecord::Migration[5.1]
  def change
    create_table :used_actors do |t|
      t.string :name, null: false
      t.integer :tmdb_id, null: false
      t.integer :game_id, null: false

      t.timestamps
    end
  end
end
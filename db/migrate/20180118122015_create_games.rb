class CreateGames < ActiveRecord::Migration[5.1]
  def change
      create_table :games do |t|
      t.integer :score, null: false

      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
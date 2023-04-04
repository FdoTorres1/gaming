class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :game_time
      t.integer :score
      t.integer :coins_won
      t.string :status

      t.timestamps
    end
  end
end

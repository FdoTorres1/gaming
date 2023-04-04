class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.integer :match_id
      t.text :description
      t.integer :bonus_coins
      t.integer :level

      t.timestamps
    end
  end
end

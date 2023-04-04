class AddGameNameToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :gameName, :string
  end
end

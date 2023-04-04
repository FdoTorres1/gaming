class AddUserNameToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :userName, :string
  end
end

class Wallet < ApplicationRecord
  belongs_to :user
  attribute :coins, :integer, default: 200
  def add_coins(amount)
    self.coins += amount
    self.save
  end
end

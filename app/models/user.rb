class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :games, dependent: :destroy
  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_one :wallet, dependent: :destroy
  has_many :matches
  has_and_belongs_to_many :achievements

  def get_games_list
    id_list = []
    self.games.each do |game|
      id_list.push(game.id)
    end
    return id_list
  end
  
  def add_coins(amount)
    self.wallet.add_coins(amount.to_i)
  end
  
end

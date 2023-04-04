class Match < ApplicationRecord
    belongs_to :user
    belongs_to :game
    has_many :achievements
end

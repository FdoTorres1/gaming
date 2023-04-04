class Achievement < ApplicationRecord
    belongs_to :match
    has_and_belongs_to_many :users
end

class Game < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :matches

  def getHighScore
    orderedMatches = self.matches.sort_by {|obj| -obj.score}
    orderedMatches.first(6)
  end
end

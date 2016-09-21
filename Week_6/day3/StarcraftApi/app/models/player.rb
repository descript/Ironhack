class Player < ApplicationRecord
  has_many :lost_matches, foreign_key: :loser_id, class_name "Match"
  has_many :won_matches, foreign_key: :winner_id, class_name "Match"
end

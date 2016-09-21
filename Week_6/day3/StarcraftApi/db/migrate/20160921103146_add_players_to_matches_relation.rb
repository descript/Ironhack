class AddPlayersToMatchesRelation < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :winner, references: :players
    add_reference :matches, :loser, references: :players
  end
end

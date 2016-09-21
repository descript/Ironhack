class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :winner_faction
      t.string :loser_faction
      t.time :duration
      t.date :date

      t.timestamps
    end
  end
end

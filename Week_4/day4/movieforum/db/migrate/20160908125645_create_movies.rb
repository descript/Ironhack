class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :year
      t.text :synopsis
      t.string :poster

      t.timestamps
    end
  end
end
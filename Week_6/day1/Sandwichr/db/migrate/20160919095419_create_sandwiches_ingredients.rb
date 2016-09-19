class CreateSandwichesIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :sandwiches_ingredients do |t|
      t.references :sandwich, foreign_key: true
      t.references :ingredients, foreign_key: true
    end
  end
end

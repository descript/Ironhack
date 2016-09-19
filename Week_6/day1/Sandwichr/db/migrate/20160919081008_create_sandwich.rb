class CreateSandwich < ActiveRecord::Migration[5.0]
  def change
    create_table :sandwiches do |t|
      t.string :name
      t.string :bread_type

      t.timestamps :datetime
    end
  end
end

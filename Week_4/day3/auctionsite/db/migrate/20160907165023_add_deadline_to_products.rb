class AddDeadlineToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :deadline, :Datetime
  end
end

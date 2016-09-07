class AddFavoritesToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :favorites, :boolean
  end
end

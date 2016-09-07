class AddPhonenumberToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :phonenumber, :string
  end
end

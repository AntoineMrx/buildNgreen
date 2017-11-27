class AddFirstNameToBuyer < ActiveRecord::Migration[5.0]
  def change
    add_column :buyers, :first_name, :string
    add_column :buyers, :last_name, :string
    add_column :buyers, :address, :text

  end
end

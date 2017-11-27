class AddDataToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :company_name, :string
    add_column :sellers, :address, :string
    add_column :sellers, :description, :text
    add_column :sellers, :website, :string
    add_column :sellers, :delivery_time, :integer
    add_column :sellers, :delivery_fee, :integer
    add_column :sellers, :delivery_free_from, :integer
  end
end

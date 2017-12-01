class AddOmniauthToBuyers < ActiveRecord::Migration[5.0]
  def change
    add_column :buyers, :provider, :string
    add_column :buyers, :uid, :string
    add_column :buyers, :facebook_picture_url, :string
    add_column :buyers, :token, :string
    add_column :buyers, :token_expiry, :datetime
  end
end

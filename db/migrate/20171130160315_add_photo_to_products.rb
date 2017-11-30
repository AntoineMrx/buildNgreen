class AddPhotoToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :photo_1, :string
    add_column :products, :photo_2, :string
    add_column :products, :photo_3, :string
  end
end

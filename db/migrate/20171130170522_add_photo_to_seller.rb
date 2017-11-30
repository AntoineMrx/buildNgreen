class AddPhotoToSeller < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :company_logo, :string
  end
end

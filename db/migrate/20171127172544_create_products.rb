class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :stock
      t.string :material
      t.string :color
      t.string :size
      t.integer :weight
      t.integer :selling_price
      t.integer :retail_price
      t.integer :vat
      t.references :seller, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.date :validation_date
      t.string :status
      t.string :address
      t.references :buyer, foreign_key: true

      t.timestamps
    end
  end
end

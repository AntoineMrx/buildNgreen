class Order < ApplicationRecord
  belongs_to :buyer
  has_many :baskets

  def sum
    sum = 0
    baskets.each do |item|
      sum += item.product_price
    end
    return sum
  end
end

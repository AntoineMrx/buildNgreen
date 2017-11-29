class Order < ApplicationRecord
  belongs_to :buyer
  has_many :baskets
  has_many :products, through: :baskets

  def sum
    sum = 0
    baskets.each do |item|
      sum += item.product_price
    end
    return sum
  end

  def tva
    return (sum*0.2/1.2).round(2)
  end
end

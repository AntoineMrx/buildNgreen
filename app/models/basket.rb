class Basket < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :seller, through: :product

  def self.total_price(array)
    total = 0
    array.each do |basket|
      price = Product.find(basket[:product_id]).selling_price
      quantity = basket.quantity
      total += (price * quantity)
    end
    return total
  end

  def self.items(buyer_id)
    order = Buyer.find(buyer_id).orders.where(status:"initiée")
    if order[0].nil?
      return ""
    else
      nb = order[0].baskets.size
      return "(#{nb})"
    end
  end
end

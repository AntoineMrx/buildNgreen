class Basket < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :seller, through: :product

  def self.total_price(array)
    total = 0
    array.each do |basket|
      price = Product.find(basket[:product_id]).selling_price
      total += price
    end
    return total
  end

  def self.items(buyer_id)
    order = Buyer.find(buyer_id).orders.where(status:"initiée")[0]
    nb = order.baskets.size
    if nb == 0
      return ""
    else
      return "(#{nb})"
    end
  end
end

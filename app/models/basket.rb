class Basket < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :seller, through: :product
end

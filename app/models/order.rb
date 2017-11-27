class Order < ApplicationRecord
  belongs_to :buyer
  has_many :baskets
end

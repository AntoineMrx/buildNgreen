class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :category
  has_many :baskets

  validates :name, presence: true
  validates :description, presence: true
  validates :selling_price, presence: true
  validates :retail_price, presence: true

end

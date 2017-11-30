class Product < ApplicationRecord

  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader

  belongs_to :seller
  belongs_to :category
  has_many :baskets


  validates :name, presence: true
  validates :description, presence: true
  validates :selling_price, presence: true
  validates :retail_price, presence: true




end

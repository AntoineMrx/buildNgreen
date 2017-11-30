class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  has_many :baskets, through: :products
  has_many :orders, through: :baskets
  validates :email, uniqueness: true, presence: true
  validates :company_name, uniqueness: true, allow_nil: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :description, presence: true
  # validates :delivery_time, presence: true
  # validates :delivery_fee, presence: true
  has_attachment :profile_pic



end

class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  validates :email, uniqueness: true, presence: true
  validates :company_name, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :description, presence: true
  # validates :delivery_time, presence: true
  # validates :delivery_fee, presence: true




end

class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :email, presence: true, uniqueness: true
  has_many :orders
  has_many :reviews
  has_many :baskets, through: :orders
  has_many :products, through: :baskets


   def self.find_for_facebook_oauth(auth)
    buyer_params = auth.slice(:provider, :uid)
    buyer_params.merge! auth.info.slice(:email, :first_name, :last_name)
    buyer_params[:facebook_picture_url] = auth.info.image
    buyer_params[:token] = auth.credentials.token
    buyer_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    buyer_params = buyer_params.to_h

    buyer = Buyer.find_by(provider: auth.provider, uid: auth.uid)
    buyer ||= Buyer.find_by(email: auth.info.email) # buyer did a regular sign up in the past.
    if buyer
      buyer.update(buyer_params)
    else
      buyer = Buyer.new(buyer_params)
      buyer.password = Devise.friendly_token[0,20]  # Fake password for validation
      buyer.save
    end

    return buyer
  end

end

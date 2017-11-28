class SellersController < ApplicationController

  before_action :set_seller, only:[:edit, :update]
  def index
  end

  def edit
  end

  def update
    @seller = seller.update(seller_params)
  end

  def show
  end

   private

  def seller_params
    params.require(:seller).permit(:first_name, :last_name, :email, :address, :password, :description, :website, :company_name)
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end
end

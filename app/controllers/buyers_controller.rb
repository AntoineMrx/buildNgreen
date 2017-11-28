class BuyersController < ApplicationController
  before_action :load_buyer, only: [:show, :update, :destroy, :edit]
  # 2nd before action will redirect to current user page, to restrict access only to current user profile
  before_action :correct_buyer,   only: [:edit, :update, :show]

  def show

  end

  def edit


  end

  def update
    @buyer.update_attributes(buyer_params)
    redirect_to buyer_path(@buyer)
  end


  def destroy
  end

  private

  def load_buyer
    @buyer = Buyer.find(params[:id])
  end

  def buyer_params
    params.require(:buyer).permit(:first_name, :last_name, :email, :address)
  end

  def correct_buyer
    @buyer = Buyer.find(params[:id])
    redirect_to buyer_path(current_buyer) unless @buyer == current_buyer
  end
end

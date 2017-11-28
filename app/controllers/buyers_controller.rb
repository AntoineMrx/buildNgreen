class BuyersController < ApplicationController
  before_action :load_buyer, only: [:show, :update, :destroy, :edit]

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
end

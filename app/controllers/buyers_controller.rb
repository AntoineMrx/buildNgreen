class BuyersController < ApplicationController
before_action :load_buyer, only: [:show, :update, :destroy, :edit]

  # def new
  # end

  # def create
  # end

  def show

  end

  def edit

  end

  def update

  end


  def destroy
  end

  private

  def load_buyer
    @buyer = Buyer.find(params[:id])
  end

  def buyer_params
    params.require(:cocktail).permit(:name, :photo)
  end

end

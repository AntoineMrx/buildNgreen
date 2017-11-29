class OrdersController < ApplicationController
before_action :load_order, only: [:show, :update, :destroy, :edit]
  def index
  end

  def show

  end

  def edit
    # see that later
    @order = Order.update(load_order)
  end

  private

  def load_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :photo)
  end
end

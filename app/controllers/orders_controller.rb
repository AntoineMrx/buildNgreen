class OrdersController < ApplicationController
before_action :load_order, only: [:show, :update, :destroy, :edit, :update]
  def index
  end

  def show

  end

  def edit
    # see that later
    @order = Order.update(load_order)
  end

  def update
    @order.update(
      status: "validation en cours",
      address: @order.buyer.address,
      order_date: Time.now
      )
  end

  private

  def load_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :buyer_id)
  end
end

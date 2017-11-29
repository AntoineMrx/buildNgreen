class OrdersController < ApplicationController
before_action :load_order, only: [:show, :update, :destroy, :edit]
  def index
  end

  def show

  end

  def edit
  end

  def new
    @order = Order.new
  end

  private

  def load_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :photo)
  end
end

   t.integer  "quantity"
    t.integer  "product_price"
    t.integer  "vat"
    t.integer  "order_id"
    t.integer  "product_id"

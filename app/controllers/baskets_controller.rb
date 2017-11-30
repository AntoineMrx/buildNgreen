class BasketsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :add_item
  before_action :load_basket, only: [:destroy, :edit]

  def show

  end

  def index
    @array = get_items_from_cookie
    @order = current_buyer.orders.where(status: "initiée")[0] if buyer_signed_in?
  end

  def add_item
    product_id = params[:id]
    if buyer_signed_in?
      order = order_en_cours
      clean_cookies(order)
      if item_in_basket?(order, product_id)
        iterate_item(order, product_id)
      else
        Basket.create(order_id: order.id, product_id: product_id, quantity: 1)
      end
    elsif session[:basket].nil?
      session[:basket] = {}
      session[:basket][product_id.to_sym] = 1
    else
      basket = session[:basket]
      if basket[product_id].nil?
        basket[product_id] = 1
      else
        basket[product_id] += 1
      end
    session[:basket] = basket
    end
    session[:basket]
  end

  def destroy
    @basket.destroy
    redirect_to baskets_path
  end

  private

  def load_basket
    @basket = Basket.find(params[:id])
  end

  def order_en_cours
    if current_buyer.orders.where(status:"initiée") == []
      order = Order.new(buyer_id: current_buyer.id, status:"initiée")
      order.save
      return order
    else
      order = current_buyer.orders.where(status:"initiée")[0]
      return order
    end
  end

  def clean_cookies(order)
    array = get_items_from_cookie
    array.each do |basket|
      basket.order_id = order.id
      basket.save
    end
    session[:basket] = nil
  end

  def item_in_basket?(order, product_id)
    order.baskets.where(product_id: product_id).size > 0
  end

  def iterate_item(order, product_id)
    basket = order.baskets.where(product_id: product_id)[0]
    basket.quantity += 1
  end

  def get_items_from_cookie
    array = []
    if session[:basket].nil?
      return array
    else
      session[:basket].each do |key, value|
        basket = Basket.new(product_id: key, quantity: value)
        array << basket
      end
    end
    return array
  end
end

class BasketsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :add_item

  def show

  end

  def index
    @array = get_items_from_cookie
  end

  def add_item
    product_id = params[:id]
    if buyer_signed_in?
      print "je suis dans le buyer"
      id = current_buyer.id
      order = order_en_cours(id)
      if item_in_basket?(order, product_id)
        iterate_item(order, product_id)
      else
        Basket.new(order_id: order.id, product_id: product_id, quantity: 1)
      end
      print order.baskets
    elsif session[:basket].nil?
      session[:basket] = {}
      session[:basket][product_id.to_sym] = 1
    else
      basket = session[:basket]
      puts "on est rentrés dans le else"
      if basket[product_id].nil?
        basket[product_id] = 1
      else
        basket[product_id] += 1
      end
    session[:basket] = basket
    end
    print session[:basket]
    session[:basket]
  end

  private

  def order_en_cours(buyer_id)
    buyer = Buyer.find(buyer_id)
    if buyer.orders.where(status:"initiée").nil?
      order = Order.new(buyer_id: id, status:"initiée")
      order.save
      return order
    else
      puts "je vais printer l'order"
      order = buyer.orders.where(status:"initiée")
      puts order.class
      puts "tu l'as vu ?"
      return order
    end
  end

  def item_in_basket?(order, product_id)
    puts "voici #{order}"
    puts order.class
    puts order.baskets
    !order.baskets.where(product_id: product_id).nil?
  end

  def iterate_item(order, product_id)
    basket = order.baskets.where(product_id: product_id)
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

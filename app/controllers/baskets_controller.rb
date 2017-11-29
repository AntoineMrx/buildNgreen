class BasketsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :add_item

  def show

  end

  def index
    @array = get_items_from_cookie
  end

  def add_item
    print "hello on est là"
    print params
    print params[:id].to_i
    product_id = params[:id].to_i
    if buyer_signed_in?
      # truc si buyer loggué
    elsif session[:basket].nil?
      print "je passe par là"
      session[:basket] = []
      session[:basket] << { product_id.to_s.to_sym => 1 }
      print "je vais imprimer session"
      print session[:basket]
    else
      basket = session[:basket]
      if basket[product_id].nil?
        basket << { product_id.to_s.to_sym => 1 }
      else
        basket[product_id.to_s.to_sym] += 1
      end
    session[:basket] = basket
    end
    session[:basket]
  end

  private

  def get_items_from_cookie
    array = []
    print session[:basket]
    puts "j'ai printé "
    session[:basket].each do |hash|
      hash.each do |key, value|
        basket = Basket.new(product_id: key, quantity: value)
        array << basket
      end
    end
    return array
  end

end

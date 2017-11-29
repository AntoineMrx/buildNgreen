class BasketsController < ApplicationController

  def show

  end

  def index
    @array = get_items_from_cookie
  end

  def add_item
    print "hello on est là"
    product_id = params[:id].to_i
    if buyer_signed_in?
      # truc si buyer loggué
    elsif session[:basket].nil?
      session[:basket] = []
      session[:basket] << { product_id.to_s.to_sym => 1 }
    else
      if session[:basket][product_id].nil?
        session[:basket] << { product_id.to_s.to_sym => 1 }
      else
        session[:basket][product_id.to_s.to_sym] += 1
      end
    end
    puts "je vais printer la session basket"
    print session[:basket]
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

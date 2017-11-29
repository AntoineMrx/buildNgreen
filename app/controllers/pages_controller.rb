class PagesController < ApplicationController
  def home
    @categories = Category.all
    @products = Product.all
    @product = Product.find(2)
  end
end

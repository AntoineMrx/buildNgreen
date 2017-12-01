class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def search
    @word = params[:word]
    @productList = []
    Product.all.each do |product|
      @productList << product if product.name.downcase.include?(@word)
    end
    p @productList

  end

  def show
    @seller = @product.seller
  end

  def new
    @product = Product.new
    @seller = Seller.find(params[:seller_id])
  end

  def edit
  end

  def update
    @product.update(product_params)
    unless request.referrer == seller_url
      redirect_to @product
    end
  end

  def create
    @product = Product.new(product_params)
    @product.seller = Seller.find(params[:seller_id])
    @product.save
    redirect_to @product
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
     params.require(:product).permit(:name, :description, :stock, :material, :color, :size, :weight, :selling_price, :retail_price, :vat, :seller_id, :category_id, :photo_1, :photo_1_cache, :photo_2, :photo_2_cache, :photo_3, :photo_3_cache)
  end
end

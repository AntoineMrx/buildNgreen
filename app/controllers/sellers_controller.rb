class SellersController < ApplicationController

  before_action :set_seller, only:[:edit, :update, :show]

  def index
    # si la company_name commence par la lettre cliquée elle nous renvoie la liste de ces companys
    # sinon elle nous montre toute la liste des companys par ordre alphabetique
    if params[:company_name]
      @sellers = Seller.where "company_name ILIKE ?", "#{params[:company_name]}%"
    else
      @sellers = Seller.all.order('company_name')
    end
  end

  def edit
  end

  def update
    @seller = @seller.update(seller_params)
    redirect_to products_path
  end

  def show
  end

   private

  def seller_params
    params.require(:seller).permit(:first_name, :last_name, :email, :address, :password, :description, :website, :company_name, :company_logo, :company_logo_cache)
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end
end

class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    if resource.is_a?(Seller)
      edit_seller_path
    elsif resource.is_a?(Buyer)
      edit_buyer_path
    end
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
    if resource.is_a?(seller)
      edit_buyer_registration_path
    elsif resource.is_a?(buyer)
      edit_buyer_registration_path
    end
  end

end

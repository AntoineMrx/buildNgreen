class Buyers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    buyer = Buyer.find_for_facebook_oauth(request.env['omniauth.auth'])

    if buyer.persisted?
      sign_in_and_redirect buyer, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_buyer_registration_url
    end
  end
end

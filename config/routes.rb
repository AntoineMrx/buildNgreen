Rails.application.routes.draw do
  devise_for :sellers
  devise_for :buyers, controllers: { registrations: "registrations" }

  resources :buyers

  root to: 'product#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

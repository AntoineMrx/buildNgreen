Rails.application.routes.draw do

  get 'categories/index'

  get 'categories/show'

  devise_for :sellers, controllers: { registrations: "registrations" }
  devise_for :buyers, controllers: { registrations: "registrations" }

  resources :buyers
  resources :sellers
  resources :products
  resources :categories


  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

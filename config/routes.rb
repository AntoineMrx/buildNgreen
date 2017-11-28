Rails.application.routes.draw do

  devise_for :sellers, controllers: { registrations: "registrations" }
  devise_for :buyers, controllers: { registrations: "registrations" }

  resources :buyers
  resources :sellers
  resources :products
  resources :categories
  resources :orders

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

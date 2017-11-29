Rails.application.routes.draw do

  get 'baskets/show'

  devise_for :sellers, controllers: { registrations: "registrations" }
  devise_for :buyers, controllers: { registrations: "registrations" }

  resources :buyers do
    resources :orders, only: [:new]
  end

  resources :sellers
  resources :products
  resources :categories
  resources :orders, only: [:index, :show, :edit]
  resources :baskets

  post "add_item", to: "baskets#add_item"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

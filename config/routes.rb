Rails.application.routes.draw do
  get 'baskets/show'

  mount Attachinary::Engine => "/attachinary"

  devise_for :sellers, controllers: { registrations: "registrations" }
  devise_for :buyers, controllers: { registrations: "registrations", omniauth_callbacks: 'buyers/omniauth_callbacks' }

  resources :buyers do
    resources :orders, only: [:new]
  end

  resources :sellers do
    resources :products, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :products, only: [:index, :show, :edit, :update]
  resources :categories
  resources :orders, only: [:index, :show, :edit]
  resources :baskets

  post "add_item/:product_id", to: "baskets#add_item"
  post "destroy_cookies_item", to: "baskets#destroy_cookies_item"
  get "search", to: "products#search"

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

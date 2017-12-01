Rails.application.routes.draw do
  get 'baskets/show'

  mount Attachinary::Engine => "/attachinary"

  devise_for :buyers, controllers: { registrations: "registrations", omniauth_callbacks: 'buyers/omniauth_callbacks' }
  devise_for :sellers, controllers: { registrations: "registrations" }

  resources :buyers do
    resources :orders, only: [:new]
  end

  resources :sellers do
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :edit, :update]
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

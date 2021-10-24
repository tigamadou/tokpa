Rails.application.routes.draw do
  resources :product_variant_options
  resources :options
  resources :cart_products
  resources :carts
  resources :order_products
  resources :orders
  resources :product_variants
  resources :products
  resources :vendors
  resources :subcategories
  resources :categories
  resources :brands
  resources :addresses
  resources :adresses
  resources :profiles
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

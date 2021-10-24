Rails.application.routes.draw do
  
  # resources :product_variant_options
  # resources :options
  # resources :cart_products
  # resources :carts
  # resources :order_products
  # resources :orders
  # resources :product_variants
  # resources :products
  # resources :vendors
  # resources :subcategories
  # resources :categories
  # resources :brands
  # resources :addresses
  
  
  
  root 'home#index'
  devise_for :users, controllers: { sessions: "session"}  
  
  
  get '/account', to: 'user#index', as: :user_root
  
  scope '/account' do
    get '/edit', to: 'user#edit'
    patch '/update', to: 'user#update'
    put '/update', to: 'user#update'

    scope '/profile' do
      get '/',  to: redirect('/account')
      get '/new', to: 'profiles#new', as: :new_profile
      post '/create', to: 'profiles#create', as: :create_profile
      get '/edit', to: 'profiles#edit', as: :edit_profile
      patch '/update', to: 'profiles#update', as: :update_profile
      put '/update', to: 'profiles#update'
    end

    
    scope '/vendor' do
      get '/', to: 'vendor#show'
      get '/edit', to: 'vendor#edit'
      patch '/update', to: 'vendor#update'
      put '/update', to: 'vendor#update'
    end

    resources :orders
    resources :addresses
  end

  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end

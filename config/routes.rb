Rails.application.routes.draw do
  
  
 
  
  
 

  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  
  root 'home#index'
  get '/query', to: 'home#search', as: :search
  get '/category/:category/', to: 'subcategory#show', as: :subcategories
  get '/category/:category/:subcategory', to: 'subcategory#show', as: :subcategory
  get '/companies/', to: 'vendor#index', as: :vendors
  get '/companies/:id', to: 'vendor#show', as: :vendor
  get '/cart', to: 'cart#show', as: :show_cart
  post '/cart',to: 'cart#create',as: :create_cart
  get '/account', to: 'user#index', as: :user_root

  get '/guest/user', to: 'home#guest_user', as: :guest_user
  get '/guest/admin', to: 'home#guest_admin', as: :guest_admin

  devise_for :users, controllers: { sessions: "session",registrations:'users/registrations'}  
  resources :categories, only: %i[show   index]  
  resources :products, only: %i[show   index]  
  resources :cart_products, only: [:destroy]

  
  
  
  
  
  scope '/account' do
    get '/edit', to: 'user#edit'
    get '/cart', to: 'user#cart'
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

    
    
    resources :orders
    resources :addresses
    
    resources :vendors, as: :mycompany
    post '/favorite/:vendor_id', to: 'favorite#create', as: :create_favorite
    delete '/favorite/:vendor_id', to: 'favorite#destroy', as: :destroy_favorite
    
  end

  namespace :admin do
    get '/', to: 'dashboard#index', as:  :dashboard
    resources :options
    resources :orders 
    resources :users
    resources :brands
    resources :addresses
    resources :subcategories, only: %i[show   destroy]
    resources :categories do
      resources :subcategories, only: %i[index create new edit update]
    end

    resources :vendors 
    resources :products do
      resources :product_variants, as: 'variants', path: 'variants' do
        resources :product_variant_options, as: 'options', path: 'otpions'
      end
    end

  end

  
end

Rails.application.routes.draw do
  
  
 
  
  
 
  get 'categories/index'
  get 'categories/show'
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  
  get '/query', to: 'home#search', as: :search
  resources :categories, only: %i[show   index]
  # get '/categories', to: 'categories#index', as: :categories
  # get '/category/:category', to: 'categories#show', as: :categeory
  get '/category/:category/:subcategories', to: 'subcategory#show', as: :subcategories
  get '/category/:category/:subcategory', to: 'subcategory#show', as: :subcategory

  get '/vendors/', to: 'vendor#index', as: :vendors
  get '/vendors/:vendor', to: 'vendor#index', as: :vendor
  
  
  
  root 'home#index'
  devise_for :users, controllers: { sessions: "session",registrations:'users/registrations'}  
  
  
  get '/account', to: 'user#index', as: :user_root
  
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
    resources :vendors
    
  end

  namespace :admin do
    get '/', to: 'dashboard#index'
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

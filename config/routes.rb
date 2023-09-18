Rails.application.routes.draw do
  root to: 'welcome#index'

  # Register and Login
  namespace :register do
    # get '/user', to: 'users#new'
    get '/provider', to: 'providers#new'
  end
  # get '/signin', to: 'session#new'

  # Search
  resources :search_results, only: [:index, :show]
  resources :search_resources, only: [:index]

  # Providers
  resources :providers, only: [:show]

  # User features
  get "/users/login", to: "users#login_form"

  post "users/login", to: "users#login"
  resources :users, only: [:index, :show, :new, :create, :edit, :update]

  post "/users/login", to: "users#login"
  get "/users/logout", to: "users#logout"
  resources :users, only: [:index, :show, :new, :create]
  
end

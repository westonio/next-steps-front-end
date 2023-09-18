Rails.application.routes.draw do
  root to: 'welcome#index'

  # Register and Login
  namespace :register do
    resources :providers
    get "/provider/login", to: "providers#login_form"
    post "/provider/login", to: "providers#login"
  end

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
  get "/logout", to: "users#logout", as: "users_logout"
  resources :users, only: [:index, :show, :new, :create]
  
end

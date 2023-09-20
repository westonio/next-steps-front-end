Rails.application.routes.draw do
  root to: 'welcome#index'

  # Register and Login
  namespace :register do
    resources :providers
  end

  #OAuth
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  # Search
  resources :search_results, only: [:index, :show]
  resources :search_resources, only: [:index]

  # Providers
  resources :providers, only: [:show]

  # User features
  get "/users/login", to: "users#login_form"

  post "users/login", to: "users#login"
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  post "/users/login", to: "users#login"
  get "/logout", to: "users#logout", as: "users_logout"
  resources :users, only: [:index, :show, :new, :create]
  
end

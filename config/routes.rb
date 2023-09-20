Rails.application.routes.draw do
  root to: 'welcome#index'

  # Register and Login
  namespace :register do
    get '/provider', to: 'providers#new'
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
  post "/users/login", to: "sessions#new"
  get "/logout", to: "sessions#logout", as: "users_logout"

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end

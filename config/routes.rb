Rails.application.routes.draw do
  root to: 'welcome#index'

  # Register and Login
  namespace :register do
    # get '/user', to: 'users#new'
    get '/provider', to: 'providers#new'
  end
  get '/signin', to: 'session#new'

  # Search
  resources :search_results, only: [:index, :show]

  # User features
  resources :users, only: [:index, :show, :new, :create]

end

Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :register do
    get '/user', to: 'users#new'
    get '/provider', to: 'providers#new'
  end
  
  get '/signin', to: 'session#new'
end

Rails.application.routes.draw do
  root to: 'welcome#home'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'welcome#home'
  delete '/logout', to: 'sessions#destroy'
  

  resources :users
  resources :rides
  resources :attractions
  resources :sessions
end

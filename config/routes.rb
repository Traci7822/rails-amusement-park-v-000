Rails.application.routes.draw do
  root to: 'users#new'
  get '/signin', to: 'users#signin'
  post '/signin', to: 'sessions#create'

  resources :users
  resources :rides
  resources :attractions
end

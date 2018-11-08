Rails.application.routes.draw do
  resources :permissions
  root 'dashboards#show'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy' 

  resources :users
  resources :groups
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

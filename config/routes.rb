Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'home#login'
  get '/signup', to: 'characters#new'
  resources :spells, only: [:index, :show]
  resources :wands, only: [:new, :edit, :update]
  resources :characters, only: [:show, :create, :edit, :update]
  resources :houses, only: [:index, :show]
end

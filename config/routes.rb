Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'home#login'
  get '/signup', to: 'characters#new'
  resources :spells, only: [:index, :show]

  resources :characters, only: [:show, :create, :edit, :update] do
    resources :wands, only: [ :new, :create, :edit, :update]
  end
  resources :houses, only: [:index, :show]
end

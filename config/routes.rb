Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#logged_in'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'characters#new'
  resources :spells, only: [:index]

  resources :characters, only: [:show, :create] do
    resources :wands, only: [ :new, :create, :edit, :update]
    resources :spells, only: [:show, :update]
    resources :familiars, only: [:new, :create, :edit, :update]
  end

  resources :houses, only: [:index, :show]
end

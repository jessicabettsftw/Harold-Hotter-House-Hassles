Rails.application.routes.draw do
  root 'home#index'
  get '/login', to: 'home#login'
  get '/signup', to: 'characters#new'
  resource :spells, only: [:index, :show]
  resource :wands, only: [:new, :edit, :update]
  resource :characters, only: [:show, :new, :create, :edit, :update]
  resource :houses, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

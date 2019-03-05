Rails.application.routes.draw do
  resource :spells, only: [:index, :show]
  resource :wands, only: [:new, :edit, :update]
  resource :characters, only: [:show, :new, :create, :edit, :update]
  resource :houses, only: [:index, :show]

  get '/', to: 'application#index'
  get '/signup', to:  'characters#new'
  get '/login', to:  'application#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

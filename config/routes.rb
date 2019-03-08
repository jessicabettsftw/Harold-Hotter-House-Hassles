Rails.application.routes.draw do
  root 'home#index'
  get '/stats', to: 'home#stats'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#logged_in'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'characters#new'
  get '/characters/:character_id/spell/:id/test' => 'spells#take_test', :as => 'take_test_spell'
  post '/characters/:character_id/spell/:id/test' => 'spells#test', :as => 'test_spell'
  resources :spells, only: [:index]

  resources :characters, only: [:show, :create] do
    resources :wands, only: [ :new, :create, :edit, :update]
    resources :spells, only: [:show, :update, :destroy]
    resources :familiars, only: [:new, :create, :edit, :update]
  end

  resources :houses, only: [:index, :show]
  #match 'user/eat_chocolate/:id' => 'user#eat_chocolate', :as => :eat_chocolate_user
end

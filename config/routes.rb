Rails.application.routes.draw do
  resource :spell, only: [:index, :show]
  resource :wand, only: [:new, :edit, :update]
  resource :character, only: [:show, :new, :create, :edit, :update]
  resource :house, only: [:index, :show]

  get '/' => 'index'
  get '/signup' => 'character#new'
  get '/login' => 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

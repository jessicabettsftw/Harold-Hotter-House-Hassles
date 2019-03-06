class CharactersController < ApplicationController
  before_action :character_params, only: [:create, :update]
  before_action :check_session, only: [:show]

  def show
    @house = @character.house.name
    #@familiar = @character.familiar.species doesnt exist yet
  end

  def new
    if session[:character_id]
      redirect_to character_path(@character)
    end
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    if @character.valid?
      session[:character_id] = @character.id
      redirect_to character_path(@character)
    else
      flash[:message] = 'Invalid Input'
      render 'new'
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :password, :password_confirmation, :house_id)
  end

end

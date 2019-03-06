class CharactersController < ApplicationController
  before_action :character_params, only: [:create, :update]

  def show
    @house = @character.house.name
    @familiar = @character.familiar.species
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    if @character.valid?
      session[:character_id] = @character.id
      redirect_to character_path(@character)
    else
      # TODO: flash message
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def character_params
    params.require(:character).permit(:name, :house_id, :familiar_id)
  end

end

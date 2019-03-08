class CharactersController < ApplicationController
  before_action :character_params, only: [:create, :update]
  before_action :check_session, only: [:show]

  helper_method :familiar_name

  def show
    @house = @character.house.name
    @familiar = @character.familiar
    @is_learned = [] #fixing _spellCard error
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
      flash[:message] = [
        "Welcome to the wonderful wizarding world of Wogwarts!",
        "You house head is #{@character.house.head_of_house}."
    ]
      redirect_to character_path(@character)
    else
      flash[:type] = "danger"
      flash[:message] = 'Invalid Input'
      render 'new'
    end
  end

  private

  def familiar_name
    CharacterFamiliar.find_by(character_id: session[:character_id]).name
  end

  def character_params
    params.require(:character).permit(:name, :password, :password_confirmation, :house_id)
  end

end

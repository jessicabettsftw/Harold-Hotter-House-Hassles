class FamiliarsController < ApplicationController
  before_action :check_session

  def new
    @familiar = CharacterFamiliar.new
  end

  def create
    @familiar = CharacterFamiliar.create(familiar_params)
    if @familiar.valid?
      flash[:type] = "success"
      flash[:message] = [
        "#{@familiar.name} seems to have taken a liking to you.",
        "A #{@character.familiar.species} really is the best companion for you."
      ]
      redirect_to character_path(@character)
    else
      flash[:message] = 'Familiar Can Not Be Created'
      redirect_to new_character_familiar_path
    end
  end

  def edit
    @familiar = CharacterFamiliar.find_by(character_id: session[:character_id])
  end

  def update
    @familiar = CharacterFamiliar.find_by(character_id: session[:character_id])
    @familiar.update(familiar_params)
    if @familiar.valid?
      flash[:type] = "success"
      flash[:message] = [
        "#{@familiar.name} seems to have taken a liking to you.",
        "A #{@character.familiar.species} really is the best companion for you."
      ]
      redirect_to character_path(@character)
    else
      flash[:message] = 'Familiar Can Not Be Created'
      redirect_to edit_character_familiar_path
    end
  end

  private

  def familiar_params
    params[:character_familiar][:character_id] = session[:character_id]
    params.require(:character_familiar).permit(:familiar_id, :name, :character_id)
  end

end

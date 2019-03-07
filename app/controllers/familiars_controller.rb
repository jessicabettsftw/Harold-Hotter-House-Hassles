class FamiliarsController < ApplicationController

  def new
    @familiar = CharacterFamiliar.new
  end

  def create
    @familiar = CharacterFamiliar.create(familiar_params)
    if @familiar.valid?
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

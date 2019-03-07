class SpellsController < ApplicationController
  before_action :check_session, only: [:show, :index]

  def index
    @spells = Spell.all
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def update
    charSpell = CharacterSpell.create(charSpell_params)
    if charSpell.valid?
      flash[:type] = "info"
      flash[:message] = "You now know how to use #{charSpell.name}"
      redirect_to character_path(@character)
    else
      flash[:message] = 'Spell cannot be learned'
      redirect_to spells_path
    end
  end

  def destroy
    charSpell = CharacterSpell.find_by(charSpell_params)
    flash[:type] = "warning"
    flash[:message] = "You forgot how to use #{charSpell.name}"
    charSpell.destroy
    redirect_to character_path(@character)
  end

  private

  def charSpell_params
    params[:character_id] = session[:character_id]
    params[:spell_id] = params[:id]
    params.permit(:spell_id, :character_id)
  end
end

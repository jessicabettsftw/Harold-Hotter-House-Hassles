class SpellsController < ApplicationController
  before_action :check_session, only: [:show, :index]

  def index
    @spells = Spell.all
  end

  def show
    @learned = learned?
    @spell = Spell.find(params[:id])
  end

  def update
    charSpell = CharacterSpell.create(charSpell_params)
    if charSpell.valid?
      redirect_to character_path(@character)
    else
      flash[:message] = 'Spell cannot be learned'
      redirect_to spells_path
    end
  end

  private

  def charSpell_params
    params[:character_id] = session[:character_id]
    params[:spell_id] = params[:id]
    params.permit(:spell_id, :character_id)
  end

  def learned?
    !!CharacterSpell.find_by(character_id: session[:character_id], spell_id: params[:id])
  end
end

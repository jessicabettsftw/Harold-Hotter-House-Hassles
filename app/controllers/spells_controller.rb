class SpellsController < ApplicationController
  def index
    @character = Character.find(params[:char_id])
    @spells = Spell.all
  end

  def show
    @learned = learned?
    @spell = Spell.find(params[:id])
  end

  def update
    @character = Character.find(params[:character_id])
    charSpell = CharacterSpell.create(charSpell_params)
    if charSpell.valid?
      redirect_to character_path(@character)
    else
      binding.pry
      redirect_to spells_path
    end
  end

  private

  def charSpell_params
    params[:spell_id] = params[:id]
    params.permit(:spell_id, :character_id)
  end

  def learned?
    !!CharacterSpell.find_by(character_id: params[:character_id], spell_id: params[:id])
  end
end

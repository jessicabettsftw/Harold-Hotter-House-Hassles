class SpellsController < ApplicationController
  before_action :check_session, only: [:show, :index]

  def index
    @spells = Spell.all
    @is_learned = @character.spells.to_a
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def destroy
    charSpell = CharacterSpell.find_by(charSpell_params)
    flash[:type] = "warning"
    flash[:message] = "You forgot how to use #{charSpell.name}"
    charSpell.destroy
    redirect_to character_path(@character)
  end

  def take_test
    @spell = Spell.find(params[:id])
    @categories = Spell.get_unique_category
    @spells_effects = Spell.get_rand_spell_effects(@spell)
  end

  def test
    @spell = Spell.find(params[:id])
    @test_spell = Spell.find_by(category: params[:spell][:category], effect: params[:spell][:effect])
    if (@test_spell != nil) && (@test_spell.id == @spell.id)
      learn_spell
    else
      flash[:type] = "warning"
      flash[:message] = "Study harder and try again."
      redirect_to spells_path
    end
  end

  private

  def learn_spell
    charSpell = CharacterSpell.create(charSpell_params)
    if charSpell.valid?
      if @spell.category == "Curse"
        flash[:type] = "danger"
        flash[:message] = "You now know how to use #{@spell.name}. How terrible of you. -30 Points to #{@character.house.name}!"
      else
        flash[:type] = "success"
        flash[:message] = "You now know how to use #{@spell.name}"
      end
      redirect_to character_path(@character)
    else
      flash[:type] = "warning"
      flash[:message] = 'Spell cannot be learned'
      redirect_to spells_path
    end
  end

  def charSpell_params
    params[:character_id] = session[:character_id]
    params[:spell_id] = params[:id]
    params.permit(:spell_id, :character_id)
  end

end

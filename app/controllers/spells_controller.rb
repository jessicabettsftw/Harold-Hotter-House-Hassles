class SpellsController < ApplicationController
  before_action :check_session, only: [:show, :index]

  def index
    @spells = Spell.all
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
    @categories = get_unique_category
    @spells_effects = get_rand_spell_effects
  end

  def test
    @spell = Spell.find(params[:id])
    @test_spell = Spell.find_by(category: params[:spell][:category], effect: params[:spell][:effect])
    if (@test_spell != nil) && (@test_spell.id == @spell.id)
      flash[:type] = "success"
      flash[:message] = "You now know #{@spell.name}"
      learn_spell
    else
      flash[:type] = "warning"
      flash[:message] = "Study harder and try again."
      redirect_to character_path(@character)
    end
  end

  private

  def learn_spell
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

  def charSpell_params
    params[:character_id] = session[:character_id]
    params[:spell_id] = params[:id]
    params.permit(:spell_id, :character_id)
  end

  def get_rand_spell_effects
    rand_spells = Spell.all.sample(3)
    rand_spells << @spell
    rand_spells.shuffle
  end
 
  def get_unique_category
    categories = []
    Spell.all.collect do |spell|
      included = false
      categories.each do |categoryspell|
        if categoryspell.category == spell.category
          included = true
        end
      end
      if included == false
        categories << spell
      end
    end
    categories
  end

end

class SpellsController < ApplicationController
  before_action :check_session, only: [:show, :index]

  def index
    if params[:sort] && sort_params
      if params[:desc] == "true"
        @spells = Spell.all.order(sort_params).reverse
        @desc = "true"
        @sort = "true"
      else
        @spells = Spell.all.order(sort_params)
        @sort = "true"
      end
    elsif params[:desc] == "true"
      @desc = "true"
      @spells = Spell.all.reverse
    else
      @spells = Spell.all
    end
    @is_learned = @character.spells.to_a
  end

  def show
    @spell = Spell.find(params[:id])
  end

  def destroy
    charSpell = CharacterSpell.find_by(charSpell_params)
    flash[:type] = "warning"
    flash[:message] = "You forgot how to use #{charSpell.name}. Points for learning this spell have been reset."
    charSpell.destroy
    redirect_to character_path(@character)
  end

  def take_test
    @spell = find_spell
    @categories = Spell.get_unique_category
    @spells_effects = Spell.get_rand_spell_effects(@spell)
  end

  def test
    @spell = find_spell
    @test_spell = Spell.find_by(test_spell_params)
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
        flash[:message] = [
          "You now know how to use #{@spell.name}.",
          "How terrible of you. -30 Points to #{@character.house.name}!"
        ]
      else
        flash[:type] = "success"
        flash[:message] = [
          "You now know how to use #{@spell.name}",
          "10 Points to #{@character.house.name}!"
        ]
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

  def sort_params
    sort_by = ["name", "category"]
    #categories = Spell.select(:category).map(&:category).uniq
    #if (params[:sort] == "category") && (params[:category].in? categories)
      #return params.permit(:category, :desc, :asc).values
    if params[:sort].in? sort_by
      return params.permit(:sort, :desc).values
    else
      return nil
    end
  end

  def test_spell_params
    params.require(:spell).permit(:category, :effect)
  end

  def find_spell
    spell_params = params.permit(:id)
    Spell.find(spell_params[:id])
  end

end

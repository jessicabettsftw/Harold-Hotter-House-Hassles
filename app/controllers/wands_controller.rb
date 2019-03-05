class WandsController < ApplicationController

  def new
    @wand = Wand.new
    @cores = Core.all
    @woods = Wood.all
  end

  def create
    @wand = Wand.create(wand_params)
    @character = Character.find(wand_params[:character_id])
    if @wand.valid?
      redirect_to character_path(@character)
    else
      redirect_to new_character_wand_path
    end
  end

  def edit
  end

  private

  def wand_params
    params.require(:wand).permit(:wood_id, :core_id, :character_id)
  end
end

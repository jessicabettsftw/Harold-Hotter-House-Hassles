class WandsController < ApplicationController
  def new
    @wand = Wand.new
    @cores = Wand.getCores
    @woods = Wand.getWoods
  end

  def edit
  end
end

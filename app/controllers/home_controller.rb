class HomeController < ApplicationController

  def index

  end

  def stats
    @most_evil_student = Character.most_evil
    # @most_known_spell = ''
    @smartest_student = Character.smartest_student
    # @most_common_familiar = ''
    @most_common_wand_core = Wand.most_common_core
    # @most_common_wand_wood = ''
    # @winning_house = ''
  end
end

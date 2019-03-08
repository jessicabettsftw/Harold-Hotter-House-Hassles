class HomeController < ApplicationController
  before_action :check_session, only: [:stats]

  def index

  end

  def stats
    @most_evil_student = Character.most_evil
    @most_common_spell = CharacterSpell.most_common_spell
    @smartest_student = Character.smartest_student
    @most_common_familiar = CharacterFamiliar.most_common_species
    @most_common_wand_core = Wand.most_common_core
    @most_common_wand_wood = Wand.most_common_wood
    @winning_house = House.winning_house
  end
end

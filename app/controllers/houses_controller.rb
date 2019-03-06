class HousesController < ApplicationController
  before_action :check_session, only: [:index, :show]

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
  end

end

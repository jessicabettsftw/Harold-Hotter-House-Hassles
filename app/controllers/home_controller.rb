class HomeController < ApplicationController
  def index

  end

  def login
    @character = Character.new
  end

  def logged_in
    @character = Character.find_by(name: params[:name])
    if @character != nil
      redirect_to @character
    else
      redirect_to '/login'
    end
  end
end

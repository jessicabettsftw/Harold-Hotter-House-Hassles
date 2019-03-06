class SessionsController < ApplicationController

  def login
    @character = Character.new
    #how to handle if session already exists
  end

  def logged_in
    @character = Character.find_by(name: params[:name])
    if @character != nil
      session[:character_id] = @character.id
      redirect_to @character
    else
      redirect_to '/login'
    end
  end

  def logout
    session.clear
    redirect_to "/"
  end


end

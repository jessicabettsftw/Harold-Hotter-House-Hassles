class SessionsController < ApplicationController

  def login
    @character = Character.new
    #how to handle if session already exists
  end

  def logged_in
    @character = Character.find_by(name: params[:name])
    if @character != nil && @character.authenticate(params[:password])
      session[:character_id] = @character.id
      redirect_to @character
    else
      flash[:message] = 'Invalid Log in'
      redirect_to login_path
    end
  end

  def logout
    session.clear
    redirect_to "/"
  end


end

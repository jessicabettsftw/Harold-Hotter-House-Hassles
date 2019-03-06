class SessionsController < ApplicationController

  def login
    @character = Character.new
    #how to handle if session already exists
  end

  def logged_in
    @character = Character.find_by(login_params)
    if @character != nil
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

  private

  def login_params
    params.permit(:name, :password)
  end


end

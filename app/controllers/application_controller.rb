class ApplicationController < ActionController::Base
  helper_method :logged_in?
  before_action :set_character
  before_action :destroy_session_if_no_characters

  def set_character
    @character ||= Character.find_by(id: session[:character_id])
  end

  def check_session
    if !session[:character_id]
      redirect_to root_path
    end
  end

  def logged_in?
    !!session[:character_id]
  end

  def destroy_session_if_no_characters
    if session[:character_id] && !Character.all.any?
      session.destroy
    end
  end
end

class ApplicationController < ActionController::Base
  helper_method :logged_in?
  before_action :set_character

  def set_character
    @character ||= Character.find_by(id: session[:character_id])
  end

  def logged_in?
    !!@character
  end
end

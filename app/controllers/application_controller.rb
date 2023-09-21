class ApplicationController < ActionController::Base
  helper_method :current_user, :current_admin?, :current_agent?, :approved?, :logged_in?
  include SessionsHelper

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user.admin?
  end

  def current_agent?
    current_user.agent? 
  end

  def approved?
    current_user.status == 'approved'
  end

  def logged_in?
    !current_user.nil?
  end

end

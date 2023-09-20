class ApplicationController < ActionController::Base
  helper_method :current_user, :current_admin?, :current_agent?

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_agent?
    current_user && current_user.agent?
  end
end

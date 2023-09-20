module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    session[:last_activity] = Time.now
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id])
  end

  def valid_session_and_user?
    logged_in? && correct_user?
  end

  def logged_in?
    session[:user_id].present?
  end

  def correct_user?
    @user = User.find(params[:id])
    current_user == @user
  end

  def log_out_user
    session.delete(:user_id)
    @_current_user = nil
    reset_session
  end

  def session_expired?
    session[:last_activity].present? && Time.now - session[:last_activity].to_time > inactivity_timeout
  end

# Timeout value should be matching with cookies session_store.rb 
# The shared/_navbar.rb script also has a longer timeframe for automatically logging out a user
  def inactivity_timeout
    15.minutes 
  end
end
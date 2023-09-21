class SessionsController < ApplicationController

  def omniauth
    if user = User.from_omniauth(request.env['omniauth.auth'])
      login(user)
      redirect_to user_path(user)
    else
      flash[:warning] = "Unable to authenticate using your Google account. Please try again"
      redirect_to users_login_path
    end
  end

  def new
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      login(user)
      flash[:success] = "Logged in successfully"
      redirect_to user_path(user.id)
    else
      flash[:warning] = "Invalid credentials. Please try again."
      redirect_to users_login_path
    end
  end

  def logout
    message = "Your session has expired. Please login again." if params[:timeout].present?
    message = "You have successfully logged out" if params[:timeout].nil?
    log_out_user
    flash[:info] = message
    redirect_to users_login_path
  end
  
  private

  def user_params
    params.permit(:username, :password)
  end
end
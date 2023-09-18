class SessionsController < ApplicationController

  def omniauth
    if user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id 
      redirect_to user_path(user)
    else
      flash[:warning] = "Unable to authenticate using your Google account. Please try again"
      redirect_to users_login_path
    end
  end
end
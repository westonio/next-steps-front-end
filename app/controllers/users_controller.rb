class UsersController < ApplicationController
  # before_action :require_login, only: [:show]
  
  def new
  end

  def show
    @user = User.find_by(id: params[:id])
    
    if @user.nil? || current_user != @user
      flash[:warning] = "You must be logged in to access this page."
      redirect_to users_login_path
    end
    # require 'pry'; binding.pry
  end  

  def create
    @user = User.new(user_params)
  
    if user_params_valid? && @user.save
      flash[:success] = "User created successfully"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:warning] = "Invalid entries, please try again"
      redirect_to new_user_path
    end
  end

  def login
    # require 'pry'; binding.pry
  end
  
  private

  def user_params
    params.permit(:username, :password)
  end
  
  def user_params_valid?
    !user_params[:username].empty? && !user_params[:password].empty? && user_params[:password] == params[:password_verify]
  end

  def require_login
    unless logged_in?
      redirect_to users_login_path, warning: "You must be logged in to access this page."
    end
  end

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

end
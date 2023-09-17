class UsersController < ApplicationController
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

  def login_form
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully"
      redirect_to user_path(user.id)
    else
      flash[:warning] = "Invalid credentials. Please try again."
      redirect_to users_login_path
    end
  end

  def edit
    @user = current_user
  end
  
  private

  def user_params
    params.permit(:username, :password)
  end
  
  def user_params_valid?
    !user_params[:username].empty? && !user_params[:password].empty? && user_params[:password] == params[:password_verify]
  end

end
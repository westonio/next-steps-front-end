class UsersController < ApplicationController
  def new
  end

  def show

  end

  def create
    
    @user = User.new(user_params)
  
    if user_params_valid? && @user.save
      flash[:notice] = "User created successfully"
      redirect_to user_path(@user)
    else
      flash[:warning] = "Invalid entries, please try again"
      redirect_to new_user_path
    end
  end
  
  private

  def user_params
    params.permit(:username, :password)
  end
  
  def user_params_valid?
    !user_params[:username].empty? && !user_params[:password].empty? && user_params[:password] == params[:password_verify]
  end
end
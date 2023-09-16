class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
  
    if user_params_valid? && @user.save
      flash[:notice] = "User created successfully"
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Invalid entries, please try again"
      render :new
    end
  end
  
  private

  def user_params
    params.permit(:username, :password, :password_verify)
  end
  
  def user_params_valid?
    user_params[:username].present? && user_params[:password].present? && user_params[:password] == user_params[:password_verify]
  end
end
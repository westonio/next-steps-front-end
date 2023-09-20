class UsersController < ApplicationController
  def new
  end

  def show
    begin
      @user = User.find_by(id: params[:id])
      raise "You must be logged in to access this page." unless valid_session_and_user?
      check_session_timeout
    rescue StandardError => e
      redirect_to users_login_path
      flash[:warning] = e.message
    end
  end  

  def create
    @user = User.new(user_params)
  
    if user_params_valid? && @user.save
      flash[:success] = "User created successfully"
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:warning] = "Invalid entries, please try again"
      redirect_to new_user_path
    end
  end

  def edit
    if !logged_in? || !correct_user?
      flash[:warning] = "You must be logged in to access this page."
      redirect_to users_login_path
    else
      @user = User.find(params[:id])
      check_session_timeout
    end
  end
  
  def update
    @user = current_user
    
    if params[:user][:new_password] == params[:user][:password_verify]
      if @user.update(password: params[:user][:new_password])
        flash[:success] = "Your password has been updated successfully."
        redirect_to user_path(params[:id])
      end
    else
      flash[:danger] = "Invalid credentials.  Please try again."
      redirect_to edit_user_path(params[:id])
    end
  end

  def destroy
    if !logged_in? || !correct_user?
      flash[:warning] = "You must be logged in to access this page."
      redirect_to users_login_path
    elsif !session_expired?
      user = User.find_by(id: params[:id])
      user.destroy
      session[:user_id] = nil
      flash[:success] = "Your account has been successfully deleted."
      redirect_to root_path
    else
      check_session_timeout 
    end
  end
  
  
  def login_form
  end

  private

  def user_params
    params.permit(:username, :password)
  end
  
  def user_params_valid?
     user_params[:password] == params[:password_verify]
  end
end
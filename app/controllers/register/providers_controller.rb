class Register::ProvidersController < ApplicationController
  before_action :require_login

  def new; end

  def create
    if provider_params_valid?
      provider = ProviderFacade.save_provider(provider_params)
      
      if provider
        flash[:success] = "Provider created successfully"
        session[:user_id] = provider.id
        redirect_to user_path(provider.id)
      else
        flash[:warning] = "Failed to create provider"
        redirect_to new_register_provider_path
      end
    else
      flash[:warning] = "Invalid entries, please try again"
      redirect_to new_register_provider_path
    end
  end  

  private

  def provider_params
    params.permit(:name, :description, :street, :city, :state, :zipcode, :phone, :fees, :schedule)
  end
    
  def provider_params_valid?
    !provider_params[:name].empty? && !provider_params[:phone].empty? && !provider_params[:street].empty? && !provider_params[:city].empty? && !provider_params[:state].empty? && !provider_params[:zipcode].empty? && !provider_params[:fees].empty? && !provider_params[:schedule].empty? && !provider_params[:description].empty?
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this page."
      redirect_to users_login_path 
    end
  end
end
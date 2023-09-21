class Register::ProvidersController < ApplicationController
  before_action :require_login

  def new; end

  def create
    if provider_params_valid?
      provider = ProviderFacade.save_provider(provider_params)
      
      if provider
        flash[:success] = "Provider created successfully"
        session[:provider_id] = provider.id
        redirect_to #user show page or provider show page?
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
    !provider_params[:name].empty? && !provider_params[:phone].empty? && !provider_params[:street].empty? && !provider_params[:city] && !provider_params[:state] && !provider_params[:zipcode] && !provider_params[:fees] && !provider_params[:schedule] && !provider_params[:description].empty?
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this page."
      redirect_to users_login_path 
    end
  end
end
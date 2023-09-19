class Register::ProvidersController < ApplicationController
  def new; end

  def login_form; end

  def show

  end

  def create
    provider = ProviderFacade.save_provider(provider_params)
  
    if provider_params_valid? && provider.response == "saved"
      flash[:success] = "Provider created successfully"
      session[:provider_id] = provider.id
      redirect_to register_provider_path(provider.id)

    else
      flash[:warning] = "Invalid entries, please try again"
      redirect_to new_register_provider_path
    end
  end

  def login
    username = params[:username]
    password = params[:password]
    provider = ProviderFacade.get_provider_login(username, password)

    if provider.response == "valid user"
      session[:provider_id] = provider.id
      flash[:success] = "Logged in successfully"
      redirect_to register_provider_path(provider.id)
    else
      flash[:warning] = "Invalid credentials. Please try again."
      redirect_to register_provider_login_path
    end
  end

  private

  def provider_params
    params.permit(:username, :password, :password_verify, :name, :phone, :email, :description)
  end

    
  def provider_params_valid?
    !provider_params[:username].empty? && !provider_params[:password].empty? && (provider_params[:password] == params[:password_verify]) && !provider_params[:name].empty? && !provider_params[:phone].empty? && !provider_params[:email].empty? && !provider_params[:description].empty?
  end
end
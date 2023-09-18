class Register::ProvidersController < ApplicationController
  def new; end

  def login_form; end

  def login
    username = params[:username]
    password = params[:password]
    provider = ProviderLoginFacade.get_provider_login(username, password)

    if provider.response.valid
      session[:provider_id] = provider.id
      flash[:success] = "Logged in successfully"
      redirect_to register_provider_path(provider.id)
    else
      flash[:warning] = "Invalid credentials. Please try again."
      redirect_to register_provider_login_path
    end
  end
end
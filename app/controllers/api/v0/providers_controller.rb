class Api::V0::ProvidersController < ApplicationController
  def new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      render json: @provider, status: :created
    else
      render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 422
    end
  end

  def show
    begin
      @provider = Provider.find(params[:id])
      render json: @provider, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: ErrorSerializer.format_errors("Provider not found"), status: 404
    end
  end

  def update
    begin
      @provider = Provider.find(params[:id])
      if @provider.update(provider_params)
        render json: @provider, status: :ok
      else
        render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 422
      end
    end
  end

  def destroy
    begin
      @provider = Provider.find(params[:id])
      if @provider.destroy
        render json: @provider, status: :ok
      else
        render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 422
      end
    rescue ActiveRecord::RecordNotFound
      render json: ErrorSerializer.format_errors("Provider not found"), status: 404
    end
  end

  private
  def provider_params
    params.require(:provider).permit(:name, :description, :street, :city, :state, :zipcode, :phone, :fees, :schedule) 
  end
end

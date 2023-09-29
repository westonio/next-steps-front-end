class Api::V0::ProviderDetailsController < ApplicationController

  def show
    begin
      provider = ProvidersFacade.new(params[:id]).provider_details
      render json: DetailedProviderSerializer.new(provider)
    rescue StandardError => e
      render json: ErrorSerializer.format_errors(e.message), status: 404
    end
  end
end
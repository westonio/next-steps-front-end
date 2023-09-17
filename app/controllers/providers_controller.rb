class ProvidersController < ApplicationController
  def show
    @provider = NextStepsService.provider_details(params[:id], params[:category])
  end
end
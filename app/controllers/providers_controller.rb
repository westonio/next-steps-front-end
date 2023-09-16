class ProvidersController < ApplicationController
  def show
    require 'pry'; binding.pry
    @results = NextStepsService.provider_details(params[:id])
    
  end
end
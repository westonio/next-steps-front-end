class SearchResourcesController < ApplicationController
  def index
    begin
      location_added?
    rescue StandardError => e
      redirect_to root_path
      flash[:danger] = e.message
    end

    @results = SearchFacade.new(params)
    @location = params[:hidden_location]
  end

  private

  def location_added?
    raise "Please enter your city, state, and/or zip code" unless !params[:hidden_location].blank?
  end
end
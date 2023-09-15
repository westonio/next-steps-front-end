class SearchResultsController < ApplicationController
  
  def index
    begin
      location_added?
      at_least_one_checked?
    rescue StandardError => e
      redirect_to root_path
      flash[:danger] = e.message
    end
    @results = SearchFacade.new(params)
  end

  private
  def location_added?
    raise "Please enter your city, state, and/or zip code" unless !params[:location].blank?
  end

  def at_least_one_checked?
    raise "Please select at least one service" unless params[:medical_care] == "1" || params[:crisis_hotline] == "1" || params[:shelter_tonight] == "1" || params[:food] == "1" || params[:substance_use] == "1"
  end
end
class SearchResultsController < ApplicationController
  
  def index
    begin
      location_added?
      at_least_one_checked?
    rescue StandardError => e
      redirect_to root_path
      flash[:danger] = e.message
    end
    @results = search_results
  end

  private
  def location_added?
    raise "Please enter your city, state, and/or zip code" unless !params[:location].blank?
  end

  def at_least_one_checked?
    raise "Please select at least one service" unless params[:urgent_care] == "1" || params[:crisis_hotline] == "1" || params[:shelter_tonight] == "1" || params[:food] == "1" || params[:substance_use] == "1" || params[:medicaid] == "1" || params[:mental_health_care] == "1" || params[:housing] == "1" || params[:food_banks] == "1" || params[:addiction_management] == "1" || params[:employment] == "1" || params[:group_therapy] == "1"
  end
end
class SearchResultsController < ApplicationController

  def index
    begin
      location_added?
      at_least_one_checked?
    rescue StandardError => e
      redirect_to root_path
      flash[:danger] = e.message
    end
    @results = SearchFacade.new(params).search_results
    @location = params[:location]
  end
  
  def show
    @location = params[:location]
    @category = params[:category]
    query = {}
    query["location"] = @location
    query["category"] = @category
    @results = SearchFacade.new(query).search_results
  end

  private
  def location_added?
    raise "Please enter your city, state, and/or zip code" unless !params[:location].blank?
  end

  def at_least_one_checked?
    selected_services = params.except(:location).select { |_, value| value == "1" }
  
    if selected_services.empty?
      raise "Please select at least one service"
    else
      return true
    end
  end
end
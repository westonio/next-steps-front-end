class SearchResourcesController < ApplicationController
  def index
    @results = SearchFacade.new(params)
    @location = params[:hidden_location]
    
    begin
      location_added?
      keyword_added?
      valid_search?(@results)
    rescue StandardError => e
      redirect_to root_path
      flash[:danger] = e.message
    end
  end

  private

  def valid_search?(results)
    raise "Please try again" unless !results.general_search.nil?
  end

  def location_added?
    raise "Please enter your city, state, and/or zip code" unless !params[:hidden_location].blank?
  end

  def keyword_added?
    raise "Please add keyword(s) to the search box" unless !params[:search].blank?
  end
end
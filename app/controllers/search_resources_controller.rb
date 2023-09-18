class SearchResourcesController < ApplicationController
  def index
    begin
      location_added?
      keyword_added?
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

  def keyword_added?
    raise "Please add keyword(s) to the search box" unless !params[:search].blank?
  end
end
class Api::V0::SearchController < ApplicationController
  def index
    begin
      result_objects = TwoOneOneSearchFacade.new(params[:keyword], params[:location]).search
      render json: FilteredProviderSerializer.new(result_objects)
    rescue 
      render json: ErrorSerializer.format_errors("Invalid Parameters"), status: 400
    end
  end
end

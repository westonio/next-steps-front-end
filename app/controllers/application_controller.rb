class ApplicationController < ActionController::Base

  def search_results
    @_search_results ||= SearchFacade.new(params)
  end
end

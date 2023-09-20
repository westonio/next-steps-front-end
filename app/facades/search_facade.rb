class SearchFacade
  attr_reader :search_results

  def initialize(params)
    @location = params[:location] || params[:hidden_location]
    @search_results = {}
    set_search_options(params)
  end

  def set_search_options(params)
    @search_results = {}
    search_keyword = params["search"]
    
    # If the search box is used, perform the search and set the @search_results hash
    if search_keyword.present?
      results = get_results(search_keyword)
      @search_results[search_keyword] = results
    end

    search_keyword = params["category"]

    # If showing the category view, just show that category
    if search_keyword.present?
      results = get_results(search_keyword)
      @search_results[search_keyword] = results
    end
  
    # Iterate through other categories passed by the form
    params.each do |key, value|
      if value == "1" && key != "location" && key != "commit" && key != "controller" && key != "action" && key != "search" && key != "category"
        results = get_results(key.to_s)
        @search_results[key] = results
      end
    end
  end
  

  def get_results(keyword)
    NextStepsService.search(@location, keyword)
  end

end
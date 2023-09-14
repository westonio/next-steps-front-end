class SearchFacade
  attr_reader :location, :medical_care, :crisis_hotline, :shelter_tonight, :food, :substance_use

  def initialize(params)
    @location = params[:location]
    @medical_care = get_results("healthcare") if params[:medical_care] == "1"
    @crisis_hotline = get_results("crisis+hotline") if params[:crisis_hotline] == "1"
    @shelter_tonight = get_results("shelter+tonight") if params[:shelter_tonight] == "1"
    @food = get_results("food") if params[:food] == "1"
    @substance_use = get_results("substance+use") if params[:substance_use] == "1"
  end

  def get_results(keyword)
    NextStepsService.search(@location, keyword)
  end

end
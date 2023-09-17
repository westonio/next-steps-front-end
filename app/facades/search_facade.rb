class SearchFacade
  attr_reader :location, 
              :urgent_care, 
              :crisis_hotline, 
              :shelter_tonight, 
              :food, 
              :substance_use, 
              :medicaid,
              :mental_health_care,
              :housing,
              :addiction_management,
              :employment,
              :group_therapy,
              :general_search

  def initialize(params)
    @location = params[:location] || params[:hidden_location]
    @urgent_care = get_results("urgent+care") if params[:urgent_care] == "1"
    @crisis_hotline = get_results("crisis+hotline") if params[:crisis_hotline] == "1"
    @shelter_tonight = get_results("shelter") if params[:shelter_tonight] == "1"
    @food = get_results("food") if params[:food] == "1"
    @substance_use = get_results("substance+use") if params[:substance_use] == "1"
    @medicaid = get_results("medicaid") if params[:medicaid] == "1"
    @mental_health_care = get_results("mental+health+care") if params[:mental_health_care] == "1"
    @housing = get_results("housing") if params[:housing] == "1"
    @addiction_management = get_results("addiction") if params[:addiction_management] == "1"
    @employment = get_results("employment") if params[:employment] == "1"
    @group_therapy = get_results("group+therapy") if params[:group_therapy] == "1"
    @general_search = get_results(params[:search])
  end

  def get_results(keyword)
    NextStepsService.search(@location, keyword)
  end

end
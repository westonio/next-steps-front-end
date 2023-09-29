class ProvidersFacade
  def initialize(id)
    @id = id
  end

  def provider_details
    service = TwoOneOneService.new
    json = service.get_provider_details(@id)
    create_provider(json)
  end
  
  
private
  def create_provider(json)
    if json.is_a?(Hash) && json[:status] == 404
      raise "Could not find a provider with that ID" 
    else
      DetailedProvider.new(json.first)
    end
  end
end
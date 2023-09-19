class ProviderFacade

  def self.save_provider(params)
    NextStepsService.post_provider(params)
  end
end
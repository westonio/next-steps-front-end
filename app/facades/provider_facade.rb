class ProviderFacade
  def self.get_provider_login(username, password)
    NextStepsService.provider_login(username, password)
  end

  def self.save_provider(params)
    NextStepsService.post_provider(params)
  end
end
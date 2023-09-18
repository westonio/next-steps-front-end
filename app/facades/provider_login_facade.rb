class ProviderLoginFacade
  def self.get_provider_login(username, password)
    NextStepsService.provider_login(username, password)
  end
end
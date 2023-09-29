class TwoOneOneSearchFacade

  def initialize(keyword, location)
    @keyword = keyword
    @location = location
  end

  def search
    service = TwoOneOneService.new
    json = service.search(@keyword, @location)
    json[:results].map do |provider_data|
      FilteredProvider.new(provider_data, @keyword)
    end
  end
end

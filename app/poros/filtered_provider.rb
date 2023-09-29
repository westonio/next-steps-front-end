class FilteredProvider
  attr_reader :id, 
              :provider_name,
              :street,
              :city,
              :state,
              :lat,
              :lon,
              :description,
              :category
  
  def initialize(data, keyword)
    @id = data[:document][:idServiceAtLocation]
    @provider_name = data[:document][:nameService]
    @street = data[:document][:address1PhysicalAddress]
    @city = data[:document][:cityPhysicalAddress]
    @state = data[:document][:statePhysicalAddress]
    @lat = data[:document][:latitudeLocation]
    @lon = data[:document][:longitudeLocation]
    @description = data[:document][:descriptionService]
    @category = keyword
  end
end

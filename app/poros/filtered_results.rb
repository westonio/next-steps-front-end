class FilteredResults
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
    @id = data[:id]
    @provider_name = data[:attributes][:provider_name]
    @street = data[:attributes][:street]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @lat = data[:attributes][:lat]
    @lon = data[:attributes][:lon]
    @description = data[:attributes][:description]
    @category = keyword
  end
end
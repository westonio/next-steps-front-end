class ProviderDetails
  attr_reader :id, 
              :provider_name,
              :street,
              :street2,
              :city,
              :state,
              :zip,
              :lat,
              :lon,
              :description,
              :website,
              :phone,
              :fees,
              :schedule,
              :category
  
  def initialize(data, keyword)
    @id = data[:id]
    @provider_name = data[:attributes][:name]
    @street = data[:attributes][:street]
    @street2 = data[:attributes][:street2]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @zip = data[:attributes][:zipcode]
    @lat = data[:attributes][:lat]
    @lon = data[:attributes][:lon]
    @description = data[:attributes][:description]
    @website = data[:attributes][:website]
    @phone = data[:attributes][:phone]
    @fees = data[:attributes][:fees]
    @schedule = data[:attributes][:schedule]
    @category = keyword
  end
end
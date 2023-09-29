class DetailedProvider
  attr_reader :id, 
              :name,
              :description,
              :street,
              :street2,
              :city,
              :state,
              :zipcode,
              :lat,
              :lon,
              :website,
              :phone,
              :fees,
              :schedule

  
  def initialize(data)
    @id = data[:idOrganization] || "Not Available"
    @name = data[:name] || "Not Available"
    @description = data[:description] || "Not Available"
    @street = data[:locations].first[:address].first[:address_1] || "Not Available"
    @street2 = data[:locations].first[:address].first[:address_2] || "Not Available"
    @city = data[:locations].first[:address].first[:city] || "Not Available"
    @state = data[:locations].first[:address].first[:state_province] || "Not Available"
    @zipcode = data[:locations].first[:address].first[:zipcode] || "Not Available"
    @lat = data[:locations].first[:latitude] || "Not Available"
    @lon = data[:locations].first[:longitude] || "Not Available"
    @website = data[:url] || "Not Available"
    @phone = get_phone(data) || "Not Available"
    @fees = data[:services].first[:fees] || "Not Available"
    @schedule = data[:locations].first[:schedule] || "Not Available"
  end

  def get_phone(data)
    if data[:services].first[:phone].present?
      find_phone(data[:services].first[:phone])
    elsif data[:locations].first[:phone].present?
      find_phone(data[:locations].first[:phone])
    end
  end

  def find_phone(phone_numbers)
    phone = phone_numbers.first
    phone[:number]
  end
end
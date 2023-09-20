class NextStepsService

  def self.search(location, keyword)
    @keyword = keyword
    get_url("search?keyword=#{keyword}&location=#{location}")
  end

  def self.get_url(url)
    response = conn.get(url)
    return JSON.parse(response.body, symbolize_names: true)[:data]&.map do |data|
      FilteredResults.new(data, @keyword) 
    end
  end
  
  def self.provider_details(id, category)
    get_provider("provider_details/#{id}", category)
  end

  def self.get_provider(url, category)
    response = conn.get(url)
    response_json = JSON.parse(response.body, symbolize_names: true)[:data]
    ProviderDetails.new(response_json, category) 
  end

  def self.post_provider(provider_info)
    response = conn.post("providers", provider_info)
   
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.conn
    Faraday.new(url: "https://ancient-reaches-38594-79ad833137d5.herokuapp.com/api/v0/")
  end
end
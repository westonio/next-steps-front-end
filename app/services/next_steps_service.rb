class NextStepsService

  def self.search(location, keyword)
    @keyword = keyword
    get_url("search?keyword=#{keyword}&location=#{location}")
  end

  def self.provider_details(id)
    get_url("provider_details?id=#{id}")
  end

  def self.get_url(url)
    response = conn.get(url)
    return JSON.parse(response.body, symbolize_names: true)[:data]&.map do |data|
      FilteredResults.new(data, @keyword) 
    end
  end

  def self.conn
    Faraday.new(url: "https://ancient-reaches-38594-79ad833137d5.herokuapp.com/api/v0/")
  end

end
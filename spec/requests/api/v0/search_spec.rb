require "rails_helper"

RSpec.describe "Search", type: :request do
  describe "GET /api/v0/search", :vcr do
    it "should return healthcare facilities near the user with 211 search API. It will return JSON that has 1. facility name, 3. short description of services, and 4. address details." do
      keyword = "healthcare"
      location = "denver+CO"

      get "/api/v0/search?keyword=#{keyword}&location=#{location}"

      response_data = JSON.parse(response.body, symbolize_names: true)
      providers = response_data[:data]

      expect(response).to be_successful
      providers.each do |provider|
        expect(provider).to have_key(:id)
        expect(provider[:id]).to be_an(String)

        expect(provider[:attributes]).to have_key(:provider_name)
        expect(provider[:attributes][:provider_name]).to be_a(String)

        expect(provider[:attributes]).to have_key(:category)
        expect(provider[:attributes][:category]).to be_a(String)

        expect(provider[:attributes]).to have_key(:description)
        expect(provider[:attributes][:description]).to be_a(String)

        expect(provider[:attributes]).to have_key(:street)
        expect(provider[:attributes][:street]).to be_a(String)

        expect(provider[:attributes]).to have_key(:city)
        expect(provider[:attributes][:city]).to be_a(String)

        expect(provider[:attributes]).to have_key(:state)
        expect(provider[:attributes][:state]).to be_a(String)

        expect(provider[:attributes]).to have_key(:lat)
        expect(provider[:attributes][:lat]).to be_a(String)

        expect(provider[:attributes]).to have_key(:lon)
        expect(provider[:attributes][:lon]).to be_a(String)
      end

    end

    it 'should return an error if the keyword is invalid' do 
      keyword = "jasdhfgkjadshfjkasd"
      location = "denver+CO"

      get "/api/v0/search?keyword=#{keyword}&location=#{location}"

      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)

      expect(error_message).to have_key(:errors)
      expect(error_message[:errors].first[:detail]).to eq("Invalid Parameters")
    end
  end
end
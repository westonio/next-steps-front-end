require 'rails_helper'

RSpec.describe 'Search', type: :request do
  describe 'GET /api/v0/provider_details/:id', :vcr do
    context 'When a valid ID is used' do
      it 'should return the details of a provider' do
        provider_id = "211tulsa-67499"
        
        get "/api/v0/provider_details/#{provider_id}"
        
        expect(response).to be_successful
        
        response_data = JSON.parse(response.body, symbolize_names: true)
        provider = response_data[:data]
        expect(provider).to have_key(:id)
        expect(provider[:id]).to be_an(String)
        
        expect(provider).to have_key(:type)
        expect(provider[:type]).to eq("detailed_provider")

        expect(provider[:attributes]).to have_key(:name)
        expect(provider[:attributes][:name]).to be_a(String)

        expect(provider[:attributes]).to have_key(:description)
        expect(provider[:attributes][:description]).to be_a(String)

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

    context 'When an invalid ID is used' do
      it 'should return an error response' do
        provider_id = 'Float::INFINITY'

        get "/api/v0/provider_details/#{provider_id}"

        expect(response).to_not be_successful
        expect(response.status).to eq(404)

        error_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors]).to be_an(Array)

        error = error_response[:errors].first

        expect(error).to have_key(:detail)
        expect(error[:detail]).to eq("Could not find a provider with that ID")
      end
    end
  end
end
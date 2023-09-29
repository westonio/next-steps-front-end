require "rails_helper"

RSpec.describe "Provider API", type: :request do
  describe "POST /api/v0/providers" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule"
        }
      end

      it "creates a provider" do
        headers = {"CONTENT_TYPE" => "application/json"}
        expect do
          post "/api/v0/providers", params: { provider: valid_params }
        end.to change(Provider, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        {
          name: nil,
          description: nil,
          street: nil,
          city: nil,
          state: nil,
          zipcode: nil,
          website: nil,
          phone: nil,
          fees: nil,
          schedule: nil
        }
      end

      it "does not create a provider" do
        headers = {"CONTENT_TYPE" => "application/json"}

        expect do
          post "/api/v0/providers", params: { provider: invalid_params }
        end.to change(Provider, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)

        response_json = JSON.parse(response.body)
        expect(response_json).to have_key("errors")
        expect(response_json["errors"]).to include({"detail"=>"Invalid Parameters"})
      end
    end
  end

  describe "GET /api/v0/providers/:id" do
    context "when the provider exists" do
      let(:provider) do
        Provider.create(
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule"
        )
      end

      it "returns provider details as JSON" do
        get "/api/v0/providers/#{provider.id}"

        expect(response).to have_http_status(:ok)

        json_response = JSON.parse(response.body)

        expect(json_response).to include(
          'id' => provider.id,
          'name' => 'Test Organization',
          'description' => 'Test Description',
          'street' => '123 Test St',
          'city' => 'Test City',
          'state' => 'TX',
          'zipcode' => '12345',
          'website' => 'https://www.test.com',
          'phone' => '123-456-7890',
          'fees' => 'Test Fees',
          'schedule' => 'Test Schedule'
        )
      end
    end

    context "when the provider does not exist" do
      it "returns a 404 (Not Found) status" do
        id = Float::INFINITY
        get "/api/v0/providers/#{id}"

        expect(response).to have_http_status(:not_found)

        expect(response.body).to include("Provider not found")
      end
    end
  end

  describe "PUT /api/v0/providers/:id" do
    context "with valid parameters" do
      let(:provider) do
        Provider.create(
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule"
        )
      end

      let(:valid_params) do
        {
          name: "Updated Organization",
          description: "Updated Description",
          street: "456 Updated St",
          city: "Updated City",
          state: "NY",
          zipcode: "54321",
          website: "https://www.updated.com",
          phone: "987-654-3210",
          fees: "Updated Fees",
          schedule: "Updated Schedule"
        }
      end

      it "updates the provider's information" do
        put "/api/v0/providers/#{provider.id}", params: { provider: valid_params }

        expect(response).to have_http_status(:ok)

        provider.reload

        expect(provider.name).to eq(valid_params[:name])
        expect(provider.description).to eq(valid_params[:description])

        expect(response.body).to include(valid_params[:name])
      end
    end

    context "with invalid parameters" do
      let(:provider) do
        Provider.create(
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule"
        )
      end

      let(:invalid_params) do
        {
          name: nil,
          description: nil,
          street: nil,
          city: nil,
          state: nil,
          zipcode: nil,
          website: nil,
          phone: nil,
          fees: nil,
          schedule: nil
        }
      end

      it "does not update the provider's information" do
        put "/api/v0/providers/#{provider.id}", params: { provider: invalid_params }

        expect(response).to have_http_status(:unprocessable_entity)

        response_json = JSON.parse(response.body)
        expect(response_json).to have_key("errors")
        expect(response_json["errors"]).to include({"detail"=>"Invalid Parameters"})
      end
    end
  end

  describe "DELETE /api/v0/providers/:id" do
    context "when the provider exists" do
      let!(:provider) do
        Provider.create(
          name: "Test Organization",
          description: "Test Description",
          street: "123 Test St",
          city: "Test City",
          state: "TX",
          zipcode: "12345",
          website: "https://www.test.com",
          phone: "123-456-7890",
          fees: "Test Fees",
          schedule: "Test Schedule"
        )
      end

      it "deletes the provider" do
        expect do
          delete "/api/v0/providers/#{provider.id}"
        end.to change(Provider, :count).by(-1)

        expect(response).to have_http_status(:ok)
      end
    end

    context "when the provider does not exist" do
      it "returns a 404 (Not Found) status" do
        id = Float::INFINITY
        delete "/api/v0/providers/#{id}"

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include("Provider not found")
      end
    end
  end
end

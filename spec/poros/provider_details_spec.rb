require 'rails_helper'

RSpec.describe ProviderDetails do
  it "returns a ProviderDetails object with expected attributes" do
    data = {
          "id": "211colorad-0014T000004o6I3QAI",
          "type": "detailed_provider",
          "attributes": {
              "id": "211colorad-0014T000004o6I3QAI",
              "name": "NEXTCARE URGENT CARE",
              "description": "<p>Provides urgent care services.</p>",
              "street": "4590 W 121st Ave",
              "street2": nil,
              "city": "Broomfield",
              "state": "CO",
              "zipcode": "80020",
              "lat": "39.915035",
              "lon": "-105.045715",
              "website": "http://nextcare.com",
              "phone": "(888) 381-4858 (Customer Service",
              "fees": "<p>Medical Care Fees, call for current fees.</p>",
              "schedule": "Monday - Friday, 8 a.m. - 8 p.m.; Saturday, Sunday, 9 a.m. - 4 p.m."
              } 
      }
    category = "Urgent Care"
    provider_details = ProviderDetails.new(data, category)

    expect(provider_details).to be_a(ProviderDetails)
    expect(provider_details.id).to eq("211colorad-0014T000004o6I3QAI")
    expect(provider_details.provider_name).to eq("NEXTCARE URGENT CARE")
    expect(provider_details.description).to eq("Provides urgent care services.")
    expect(provider_details.street).to eq("4590 W 121st Ave")
    expect(provider_details.city).to eq("Broomfield")
    expect(provider_details.state).to eq("CO")
    expect(provider_details.zip).to eq("80020")
    expect(provider_details.lat).to eq("39.915035")
    expect(provider_details.lon).to eq("-105.045715")
    expect(provider_details.website).to eq("http://nextcare.com")
    expect(provider_details.phone).to eq("(888) 381-4858 (Customer Service")
    expect(provider_details.fees).to eq("Medical Care Fees, call for current fees.")
    expect(provider_details.schedule).to eq("Monday - Friday, 8 a.m. - 8 p.m.; Saturday, Sunday, 9 a.m. - 4 p.m.")
    expect(provider_details.category).to eq(category)
  end
end
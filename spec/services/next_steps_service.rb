require "rails_helper"

RSpec.describe "NextStepsService", type: :service do
  describe "pass a keyword and location", :vcr do
    it "should return a FilteredResults object with expected attributes" do
      keyword = "urgent+care"
      location = "denver"
      response = NextStepsService.search(keyword, location)

      expect(response).to be_a(Array)
      expect(response.first).to be_a(FilteredResults)
      expect(response.first.id).to be_a(String)
      expect(response.first.category).to be_a(String)
      expect(response.first.provider_name).to be_a(String)
      expect(response.first.street).to be_a(String)
      expect(response.first.city).to be_a(String)
      expect(response.first.state).to be_a(String)
      expect(response.first.lat).to be_a(String)
      expect(response.first.lon).to be_a(String)
      expect(response.first.description).to be_a(String)
    end
  end
end

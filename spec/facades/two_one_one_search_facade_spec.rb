require 'rails_helper'

RSpec.describe TwoOneOneSearchFacade, :vcr do
  describe "#search(keyword, location)" do
    it "returns the top ten results for a given keyword and location" do
      keyword = "healthcare"
      location = "denver+CO"
      facade = TwoOneOneSearchFacade.new(keyword, location)
      providers = facade.search

      expect(providers).to be_an(Array)
      expect(providers.count).to eq(10)
      
      providers.each do |provider|
        expect(provider).to be_a(FilteredProvider)
      end
    end
  end
end
      

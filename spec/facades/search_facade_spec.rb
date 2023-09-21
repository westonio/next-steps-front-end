require "rails_helper"

RSpec.describe "SearchFacade", type: :service do
  describe "pass a keyword(s) and location", :vcr do
    it "should add search restults based on keywords passed" do
      params = {}
      params["location"] = "Denver"
      params["urgent care"] = "1"
      params["crisis hotline"] = "0"
      params["temporary shelter"] = "0"
      params["food"] = "1"
      params["substance use"] = "0"
      results = SearchFacade.new(params).search_results
      
      expect(results).to be_a(Hash)
      expect(results["urgent care"]).to be_an(Array)
      expect(results["urgent care"].first).to be_a(FilteredResults)
      expect(results["urgent care"].first.category).to eq("urgent care")
      expect(results["urgent care"].first.city).to be_a(String)
      
      expect(results["crisis hotline"]).to be nil
      expect(results["temporary shelter"]).to be nil
      expect(results["substance use"]).to be nil
    end

    it "EDGE CASE: If no keywords passed or keywords missing this will result in all attributes = nil" do
      params = {}
      params["location"] = "Denver"
      # MISSING PARAMETER:  params[:urgent_care] = "0"
      params["crisis hotline"] = "0"
      params["temporary shelter"] = "0"
      params["food"] = "0"
      params["substance use"] = "0"
      results = SearchFacade.new(params).search_results
      
      expect(results).to be_a(Hash)
      expect(results["urgent care"]).to be nil
      expect(results["crisis hotline"]).to be nil
      expect(results["temporary shelter"]).to be nil
      expect(results["food"]).to be nil
      expect(results["substance_use"]).to be nil
    end

    it "EDGE CASE: If no location passed this will result in country-wide results" do
      params = {}
      # MISSING PARAMETER:  params["location"] = "Denver"
      params["urgent care"] = "1"
      params["crisis hotline"] = "0"
      params["temporary shelter"] = "0"
      params["food"] = "1"
      params["substance use"] = "0"
      results = SearchFacade.new(params).search_results
      
      expect(results).to be_a(Hash)
      expect(results["urgent care"]).to be_an(Array)
      expect(results["urgent care"].first).to be_a(FilteredResults)
      expect(results["urgent care"].first.category).to eq("urgent care")
      expect(results["urgent care"].first.city).to be_a(String)

      expect(results["food"]).to be_an(Array)
      expect(results["food"].first).to be_a(FilteredResults)
      expect(results["food"].first.category).to eq("food")
      expect(results["food"].first.city).to be_a(String)
      
      expect(results["crisis hotline"]).to be nil
      expect(results["temporary shelter"]).to be nil
      expect(results["substance_use"]).to be nil
    end
  end
end
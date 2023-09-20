require "rails_helper"

# RSpec.describe "SearchFacade", type: :service do
#   describe "pass a keyword(s) and location", :vcr do
#     it "should add search restults based on keywords passed" do
#       params = {}
#       params[:location] = "Denver"
#       params[:urgent_care] = "1"
#       params[:crisis_hotline] = "0"
#       params[:shelter_tonight] = "0"
#       params[:food] = "1"
#       params[:substance_use] = "0"
#       facade = SearchFacade.new(params)
      
#       expect(facade.urgent_care).to be_an(Array)
#       expect(facade.urgent_care.first).to be_a(FilteredResults)
#       expect(facade.urgent_care.first.category).to eq("urgent+care")
#       expect(facade.urgent_care.first.city).to be_a(String)
      
#       expect(facade.crisis_hotline).to be nil
#       expect(facade.shelter_tonight).to be nil
#       expect(facade.substance_use).to be nil
#     end

#     it "EDGE CASE: If no keywords passed or keywords missing this will result in all attributes = nil" do
#       params = {}
#       params[:location] = "Denver"
#       # MISSING PARAMETER:  params[:urgent_care] = "0"
#       params[:crisis_hotline] = "0"
#       params[:shelter_tonight] = "0"
#       params[:food] = "0"
#       params[:substance_use] = "0"
#       facade = SearchFacade.new(params)
      
#       expect(facade.urgent_care).to be nil
#       expect(facade.crisis_hotline).to be nil
#       expect(facade.shelter_tonight).to be nil
#       expect(facade.food).to be nil
#       expect(facade.substance_use).to be nil
#     end

#     it "EDGE CASE: If no location passed this will result in country-wide results" do
#       params = {}
#       # MISSING PARAMETER:  params[:location] = "Denver"
#       params[:urgent_care] = "1"
#       params[:crisis_hotline] = "0"
#       params[:shelter_tonight] = "0"
#       params[:food] = "1"
#       params[:substance_use] = "0"
#       facade = SearchFacade.new(params)
      
#       expect(facade.urgent_care).to be_an(Array)
#       expect(facade.urgent_care.first).to be_a(FilteredResults)
#       expect(facade.urgent_care.first.category).to eq("urgent+care")
#       expect(facade.urgent_care.first.city).to be_a(String)

#       expect(facade.food).to be_an(Array)
#       expect(facade.food.first).to be_a(FilteredResults)
#       expect(facade.food.first.category).to eq("food")
#       expect(facade.food.first.city).to be_a(String)
      
#       expect(facade.crisis_hotline).to be nil
#       expect(facade.shelter_tonight).to be nil
#       expect(facade.substance_use).to be nil
#     end
#   end
# end
require 'rails_helper'

RSpec.describe "Search Resources Index" do
  describe "As a visitor" do
    describe "when I visit the search_resources_path", :vcr do
      it "shows the results of my search" do
        visit "http://localhost:3000/search_resources?search=family&hidden_location=denver"

        expect(page).to have_content("Provider name: FAMILY SUPPORT")
        expect(page).to have_content("Address: 11177 W 8th Ave")
        expect(page).to have_content("City: Lakewood")
        expect(page).to have_content("Description: Provides funding to address disability")
      end
    end

    context "sad path" do
      it "throws an error if the location is not added" do
        visit root_path

        within('div.search-bar') do
          fill_in :search, with: "Family"
          click_on "Search"
        end

        expect(page).to have_content("Please enter your city, state, and/or zip code")
      end
    end
  end
end
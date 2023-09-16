require 'rails_helper'

RSpec.describe "Providers Show page", :vcr do
  describe "As a visitor" do
    describe "When I see my fulls search results page '/search_results/[category]?location=[valid location]&[category]=1" do
      it "I see that each providers name is a link.  If I click that link, I am taken to a page which shows all of the providers information, including phone number" do
        visit "http://localhost:3000/search_results/Urgent%20Care?location=Thornton%2C+CO&urgent_care=1"
        id = "211colorad-a0h4T000003fVncQAE"
        click_link(class: "provider-details-#{id}")

        expect(current_path).to eq provider_path(id: id)
        expect(page).to have_content("MEDICAL CARE")
        expect(page).to have_content("4590 W 121st Ave")
        expect(page).to include("Assists with:Common illnesses")
        expect(page).to have_content("303-555-1212")
      end
    end
  end
end
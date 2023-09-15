require 'rails_helper'

RSpec.describe "Category Index", :vcr do
  describe "As a visitor" do
    describe "When I have successfully entered a search for an urgent resource, and I am taken to the Search Results Page." do
      it "I see a link to 'See more results' under each category heading.  When I click that link I am taken to a new page '/providers/categories/:id' which displays all returned results for that category." do
        visit root_path
        within('div.select-urgent-services') do
          fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
          check('Urgent Care')
          click_button('Get Help!')
        end
        
        expect(page).to have_link("See more results")

        click_link("See more results")

        expect(current_path).to eq("/providers/categories/urgent_care")
        expect(page).to have_css(".result-item", count: 4) # This checks for 4 or more
      end
    end
  end
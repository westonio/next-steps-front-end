require 'rails_helper'

RSpec.describe 'Welcome Page', :vcr do
  describe 'when I visit the welcome page "/" ' do
    before :each do
      visit root_path
    end

    describe 'Header / Navigation Bar' do
      it 'has the app name - Next Steps' do
        within('div#app-topper') do
          expect(page).to have_content('Next Steps')
        end
      end

      it 'has the slogan - Help is near!' do
        within('div#app-topper') do
          expect(page).to have_content('Help is near!')
        end
      end

      it 'links to Home, Create an Account, Sign In' do
        within('.navbar') do
          expect(page).to have_link('Home', href: '/')
          expect(page).to have_link('Create user account', href: new_user_path)
          expect(page).to have_link('Create provider account', href: '/register/provider')
          expect(page).to have_link('Sign in', href: '/signin')
        end
      end
    end

    describe 'Urgent Services' do
      it 'Has a section for "I need urgent help now!" ' do
        within('div.select-services') do
          expect(page).to have_content('I need urgent help now!')
        end
      end

      it 'Has a field to enter location" ' do 
        within('div.select-services') do
          expect(page).to have_field('Enter your City, State, and/or Zip Code')
        end
      end

      it 'has a checkbox for: Urgent Care, Crisis Hotline, Shelter For Tonight, Food, and Susbstance Use' do
        within('div.select-services') do
          expect(page).to have_content('What do you need most help with today? (Check all that apply):')
          expect(page).to have_field('Urgent Care', checked: false)
          expect(page).to have_field('Crisis Hotline', checked: false)
          expect(page).to have_field('Shelter for Tonight', checked: false)
          expect(page).to have_field('Food', checked: false)
          expect(page).to have_field('Substance Use', checked: false)
        end
      end
        
      it 'has a button "Get Urgent Services"' do
        expect(page).to have_button('Get Help!')
      end
        
      context 'using the form' do
        it 'shows error if no location information is provided' do
          within('div.select-services') do
            check('Medicaid')
            expect(page).to have_checked_field('Medicaid')
            click_button('Get Help!')
          end

          expect(page).to have_text('Please enter your city, state, and/or zip code')
        end
          
        it 'shows error if no service is selected' do
          within('div.select-services') do
            fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
          end
          
          click_button('Get Help!')
          expect(page).to have_content('Please select at least one service')
        end
          
        it 'redirects to the search results page if at least one service is selected' do
          within('div.select-services') do
            fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
            check('Urgent Care')
            
            expect(page.has_checked_field?('Urgent Care')).to eq(true)
            
            click_button('Get Help!')
           
            expect(current_path).to eq(search_results_path)
          end
        end
      end
    end

    describe "Will return search results based on selected categories" do
      it "If Urgent Care is selected, that category will be displayed" do
        within('div.select-services') do
          fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
          check('Urgent Care')
          check('Food')
          click_button('Get Help!')
        end
        
        expect(current_path).to eq(search_results_path)
        expect(page).to have_content("Urgent Care results")
        expect(page).to_not have_content("Crisis Hotline results")
        expect(page).to_not have_content("Shelter for Tonight results")
        expect(page).to have_content("Food results")
        expect(page).to_not have_content("Substance Use results")
      end
    end
    
    describe "geolocation" do
      it "uses JavaScript geolocation to auto-populate the location text_field" do
        within('div.select-services') do
          expect(page).to have_button("Find Location")
        end
      end
    end

    describe "motivational sentences" do
      it "displays a motivational sentence on the page at random" do
        expect(page).to have_selector(".motivational-sentence")
      end
    end

    # Non-Urgent Resources Section
    describe "non-urgent services" do
      it "has a section that says 'I would like assistance with:'" do
        within('div.select-services') do
          expect(page).to have_content("I would like non-urgent assistance with:")
        end
      end

      it 'has a checkbox for: Medicaid, Mental health care, Housing, Food Banks, Addiction Management, Employment, and Group Help' do
        within('div.select-services') do
          expect(page).to have_content('What do you need long-term support with? (Check all that apply):')
          expect(page).to have_field('Medicaid', checked: false)
          expect(page).to have_field('Mental Health Care', checked: false)
          expect(page).to have_field('Housing', checked: false)
          expect(page).to have_field('Addiction Management', checked: false)
          expect(page).to have_field('Employment', checked: false)
          expect(page).to have_field('Group Help', checked: false)
        end
      end
        
      context 'using the form' do
        it 'shows error if no location information is provided' do
          within('div.select-services') do
            check('Medicaid')
            click_button('Get Help!')
          end
          
          expect(page).to have_content('Please enter your city, state, and/or zip code')
        end
          
        it 'shows error if no service is selected' do
          within('div.select-services') do
            fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
            click_button('Get Help!')
          end
          
          expect(page).to have_content('Please select at least one service')
        end
          
        it 'redirects to the search results page if at least one service is selected' do
          within('div.select-services') do
            fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
            check('Medicaid')
            
            expect(page.has_checked_field?('Medicaid')).to eq(true)
            
            click_button('Get Help!')
            
            expect(current_path).to eq(search_results_path)
          end
        end
      end
    end

    describe "Will return search results based on selected categories" do
      it "If Medicaid is selected, that category will be displayed" do
        within('div.select-services') do
          fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
          check('Medicaid')
          check('Housing')
          click_button('Get Help!')
        end
        
        expect(current_path).to eq(search_results_path)
        expect(page).to have_content("Medicaid results")
        expect(page).to_not have_content("Mental Health Care results")
        expect(page).to have_content("Housing results")
        expect(page).to_not have_content("Food Banks results")
        expect(page).to_not have_content("Addiction Management results")
        expect(page).to_not have_content("Employment results")
        expect(page).to_not have_content("Group Help results")
      end
    end
  end
end
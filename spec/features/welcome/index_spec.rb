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
          expect(page).to have_link('Create user account', href: '/register/user')
          expect(page).to have_link('Create provider account', href: '/register/provider')
          expect(page).to have_link('Sign in', href: '/signin')
        end
      end
    end

    describe 'Urgent Services' do
      it 'Has a section for "I need urgent help now!" ' do
        within('div.select-urgent-services') do
          expect(page).to have_content('I need urgent help now!')
        end
      end

      it 'Has a field to enter location" ' do 
        within('div.select-urgent-services') do
          expect(page).to have_field('Enter your City, State, and/or Zip Code')
          # TODO: Need to add geolocation services to automatically find their location
        end
      end

      it 'has a checkbox for: Medical Care, Crisis Hotline, Shelter For Tonight, Food, and Susbstance Use' do
        within('div.select-urgent-services') do
          expect(page).to have_content('What do you need most help with today? (Check all that apply):')
          expect(page).to have_field('Medical Care', checked: false)
          expect(page).to have_field('Crisis Hotline', checked: false)
          expect(page).to have_field('Shelter for Tonight', checked: false)
          expect(page).to have_field('Food', checked: false)
          expect(page).to have_field('Substance Use', checked: false)
        end
      end

      it 'has a button "Get Urgent Services"' do
        within('div.select-urgent-services') do
          expect(page).to have_button('Get Help!')
        end
      end

      context 'using the form' do
        it 'shows error if no location information is provided' do
          within('div.select-urgent-services') do
            check('Medical Care')
            click_button('Get Help!')
          end
          
          expect(page).to have_content('Please enter your city, state, and/or zip code')
        end

        it 'shows error if no service is selected' do
          within('div.select-urgent-services') do
            fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
            click_button('Get Help!')
          end
            
          expect(page).to have_content('Please select at least one service')
        end

        it 'redirects to the search results page if at least one service is selected' do
          within('div.select-urgent-services') do
            fill_in 'Enter your City, State, and/or Zip Code', with: 'Denver, Colorado'
            check('Medical Care')
            
            expect(page.has_checked_field?('Medical Care')).to eq(true)
            
            click_button('Get Help!')
            
            expect(current_path).to eq(search_results_path)
          end
        end
      end
    end
  end
end
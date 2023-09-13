require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  describe 'when I visit the welcome page "/" ' do
    context 'Header / Navigation Bar' do
      before :each do
        visit root_path
      end

      it 'has the app name - Next Steps' do
        within('#app-topper') do
          expect(page).to have_content('Next Steps')
        end
      end

      it 'has the slogan - Help is near!' do
        within('#app-topper') do
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
  end
end
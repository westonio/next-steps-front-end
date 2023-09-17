require 'rails_helper'

RSpec.describe 'User Login page', :vcr do
  describe "As a Visitor" do
    describe "When I visit the user login page '/users/login'" do
      
      before do
        visit users_login_path
      end

      it "I see a place to enter my username and password" do
        #
      end

      it "If I enter a valid username and password, I am directed to my Dashboard page '/users/:id'" do
        #
      end

      it "SAD PATH:  If I enter an invalid username or password, I stay on the same page and see a warning message that my credentials are invalid" do
        #
      end
    end
  end
end
require 'rails_helper'

RSpec.describe 'User Registration page', :vcr do
  describe "As a Visitor" do
    describe "When I visit the user registation page '/users/create'" do
      it "I see a link to sign in if I already have an account" do
        #
      end
      it "I see text boxes to create a username, choose a password, and to confirm the password" do
        #
      end
      it "If I fill in a username that already exists or if my passwords do not match, I remain on the same page and see an error message, 'Invalid entries, please try again'" do
        #
      end
      it "If I fill in a valid username and passwords then I am directed to a Dashboard page '/users/id'" do
        #
      end
    end
  end
end
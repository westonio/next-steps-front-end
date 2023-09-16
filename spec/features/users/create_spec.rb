require 'rails_helper'

RSpec.describe 'User Registration page', :vcr do
  describe "As a Visitor" do
    before: each do
      visit user_new_path
    end
    describe "When I visit the user registation page '/users/create'" do
      it "I see a link to sign in if I already have an account." do
        expect(page).to have_content("Do you already have an account?  Click here to sign in")
        expect(page).to have_link("sign in", href: user_new_path)
      end

      it "I see text boxes to create a username, choose a password, and to confirm the password" do
        expect(page).to have_textbox("Choose a username")
        expect(page).to have_textbox("Enter a password")
        expect(page).to have_textbox("Confirm the password")
        expect(page).to have_button("Create Account")
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
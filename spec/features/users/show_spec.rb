require 'rails_helper'

RSpec.describe 'User Dashboard page', :vcr do
  describe "As a Visitor" do
    it "I should not be able to access any user dashboard '/users/:id' and should instead be redirected to the login page.  And, I should see an error message indicating that I need to log in first" do
      registered_user = User.create!(username: "my_username", password: "my_password")
      visit user_path(registered_user.id)

      expect(current_path).to eq users_login_path
      expect(page).to have_content("You must be logged in to access this page.")
    end
  end
  describe "As a logged in user" do
    it "when I visit my dashboard '/users/:id', I should see my username, a link to change my password, and a 'Favorite Providers' section." do
      user = User.create!(username: "my_username", password: "my_password")
      visit users_login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Login"

      expect(current_path).to eq user_path(id: user.id)
      expect(page).to have_content("#{user.username}")
      expect(page).to have_content("Change password")
      expect(page).to have_content("My Favorite Providers")
    end
  end
end
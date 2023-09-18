require 'rails_helper'

RSpec.describe 'User Edit page', :vcr do

  describe "As a Visitor" do
    it "I should not be able to access any edit page.  I should be redirected to the login page with a message that I must log in to access that page" do
      user1 = User.create!(username: "my_username1", password: "my_password1")
      visit edit_user_path(user1.id)
      
      expect(current_path).to eq users_login_path
      expect(page).to have_content("You must be logged in to access this page.")
    end

    it "If I visit an invalid account page, I should be redirected to the login page with a message that I must be logged in to access that page" do
      visit edit_user_path(9999999999999999)
      
      expect(current_path).to eq users_login_path
      expect(page).to have_content("You must be logged in to access this page.")
    end
  end
  describe "As a logged in user" do
    
    it "I should not be able to access the edit page for another user" do
      user1 = User.create!(username: "my_username1", password: "my_password1")
      user2 = User.create!(username: "my_username2", password: "my_password2")
      visit users_login_path
      fill_in "Username", with: user1.username
      fill_in "Password", with: user1.password
      click_button "Login"
      visit edit_user_path(user2.id)
    end
  end
end
require 'rails_helper'

RSpec.describe 'User Login page', :vcr do
  describe "As a Visitor" do
    describe "When I visit the user login page '/users/login'" do
      
      before do
        visit users_login_path
        @user = User.create!(username: 'my_username', password: 'my_password')
      end

      it "I see a place to enter my username and password" do
        expect(page).to have_field("username")
        expect(page).to have_field("password")
        expect(page).to have_button("Login")
      end

      it "If I enter a valid username and password, I am directed to my Dashboard page '/users/:id'" do
        fill_in "username", with: @user.username
        fill_in "password", with: @user.password
        click_button "Login"

        expect(current_path).to eq user_path(@user.id)
      end

      it "SAD PATH:  If I enter an invalid username or password, I stay on the same page and see a warning message that my credentials are invalid" do
        fill_in "username", with: "wrong_username"
        fill_in "password", with: @user.password
        click_button "Login"

        expect(current_path).to eq users_login_path
        expect(page).to have_content("Invalid credentials. Please try again.")

        fill_in "username", with: @user.username
        fill_in "password", with: "wrong_password"
        click_button "Login"

        expect(current_path).to eq users_login_path
        expect(page).to have_content("Invalid credentials. Please try again.")
      end
    end
  end

  describe "As a logged in user" do
    it "I no longer see the links for 'Create user account', 'Create provider account', or 'Sign in'.  Instead see links to 'View my Dashboard' and 'Log out'." do
      visit root_path

      expect(page).to have_link("Create user account")
      expect(page).to have_link("Create provider account")
      expect(page).to have_link("Sign in")
      expect(page).to_not have_link("View my Dashboard")
      expect(page).to_not have_link("Sign out")
      
      visit users_login_path
      @user = User.create!(username: 'my_username', password: 'my_password')
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      click_button "Login"
      
      expect(page).to_not have_link("Create user account")
      expect(page).to_not have_link("Create provider account")
      expect(page).to_not have_link("Sign in")
      expect(page).to have_link("View my Dashboard")
      expect(page).to have_link("Sign out")

      visit root_path
      
      expect(page).to_not have_link("Create user account")
      expect(page).to_not have_link("Create provider account")
      expect(page).to_not have_link("Sign in")
      expect(page).to have_link("View my Dashboard")
      expect(page).to have_link("Sign out")
    end

    it "When I am logged in and click the 'Sign out' link, I am redirected to the home page where I see the original links and I no longer see a link to 'Log out'.  There is also a message that I have successfully logged out" do
      visit users_login_path
      @user = User.create!(username: 'my_username', password: 'my_password')
      fill_in "username", with: @user.username
      fill_in "password", with: @user.password
      click_button "Login"

      expect(page).to_not have_link("Create user account")
      expect(page).to_not have_link("Create provider account")
      expect(page).to_not have_link("Sign in")
      expect(page).to have_link("View my Dashboard")
      expect(page).to have_link("Sign out")

      click_link("Sign out", match: :first)

      expect(current_path).to eq root_path
      expect(page).to have_link("Create user account")
      expect(page).to have_link("Create provider account")
      expect(page).to have_link("Sign in")
      expect(page).to_not have_link("View my Dashboard")
      expect(page).to_not have_link("Sign out")
    end
  end
end
require 'rails_helper'

RSpec.describe "Provider Registration Page", :vcr do
  before do
    visit register_provider_login_path

    response = stub_request(:post, 'https://ancient-reaches-38594-79ad833137d5.herokuapp.com/api/v0/provider_login')
      .with(body: { username: 'testy', password: 'password' })
      .to_return(status: 200, body: '{"message": "valid user", "id": "1"}')

    @provider = response.request_pattern.body_pattern.pattern
  end
  
  describe "as a visitor" do
    describe "when I visit the provider login page" do
      it "I see a place to enter my username and password" do
        expect(page).to have_field("username")
        expect(page).to have_field("password")
        expect(page).to have_button("Login")
      end
      
      it "if I enter a valid username and password, I am directed to my Dashboard page" do
        
        fill_in "username", with: 'testy'
        fill_in "password", with: 'password'
        click_button "Login"

        expect(current_path).to eq(register_provider_path(1))
      end

      xit "SAD PATH:  If response from back-end API returns 'invalid' (wrong username or password), I stay on the page and see warning message" do
        fill_in "username", with: "incorrect_username"
        fill_in "password", with: "password"
        click_button "Login"

        expect(current_path).to eq(register_provider_login_path)
        expect(page).to have_content("Invalid credentials. Please try again.")

        fill_in "username", with: "testy"
        fill_in "password", with: "wrong_password"
        click_button "Login"

        expect(current_path).to eq(register_provider_login_path)
        expect(page).to have_content("Invalid credentials. Please try again.")
      end
    end

    describe "as a logged in user" do
      xit "I do not see the links for 'create user account', 'create provider account', or 'sign in' and I see links to 'view my dashboard' and 'log out' instead" do
        visit root_path

        expect(page).to have_link("Create user account")
        expect(page).to have_link("Create provider account")
        expect(page).to have_link("Sign in")
        expect(page).to_not have_link("View my Dashboard")
        expect(page).to_not have_link("Sign out")

        visit register_provider_login_path
        fill_in "username", with: "testy"
        fill_in "password", with: "password"
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

      xit "When I am logged in and click the 'View my Dashboard' link, I am taken to my Dashboard page" do
        visit register_provider_login_path
        fill_in "username", with: "testy"
        fill_in "password", with: "password"
        click_button "Login"
  
        visit root_path
        click_link("View my Dashboard", match: :first)
  
        expect(current_path).to eq(register_provider_path(1))
      end

      xit "if logged in, when I click 'sign out', I am redirected to the home page and no longer see a link to 'log out', and a message says I have successfully logged out" do
        visit register_provider_login_path
        fill_in "username", with: "testy"
        fill_in "password", with: "password"
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
        expect(page).to have_content("You have successfully logged out")
      end
    end
  end
end
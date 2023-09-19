require 'rails_helper'

RSpec.describe "Provider Registration Page", :vcr do
  describe "as a visitor" do
    before do 
      visit new_register_provider_path
    end

    describe "when I visit the provider registration page '/register/providers#new" do
      it "I see a link to sign in" do
        expect(page).to have_content("Do you already have an account? Click here to sign in")
        expect(page).to have_link("Click here to sign in", href: register_provider_login_path)
      end

      it "I see text boxes to create a username,password, confirm password, orgization name (name), phone, email, description of services, and button to submit" do
        expect(page).to have_content("Choose a username")
        expect(page).to have_field("username")
        expect(page).to have_content("Enter a password")
        expect(page).to have_field("password")
        expect(page).to have_content("Confirm the password")
        expect(page).to have_field("password_verify")
        expect(page).to have_content("Organization name")
        expect(page).to have_field("name")
        expect(page).to have_content("Contact phone")
        expect(page).to have_field("phone")
        expect(page).to have_content("Email")
        expect(page).to have_field("email")
        expect(page).to have_content("Description of services")
        expect(page).to have_field("description")
        expect(page).to have_button("Create Account")
      end

      it "HAPPY PATH:  If I fill in a valid username and passwords and information then I am directed to a Dashboard page '/register/providers/id'" do

        
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"

        expect(page).to have_content("Provider Dashboard")
      end

      before do

      end

      xit "SAD PATH:  If I fail to fill in a username , I remain on the same page and see an error message, 'Invalid entries, please try again'" do
        # fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"

        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")
      end
      
      xit "SAD PATH:  If I fail to fill in a password or password verification, I remain on the same page and see an error message, 'Invalid entries, please try again'" do
        fill_in "username", with: "my_username"
        # fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")

        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        # fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH:  If my passwords do not match, I remain on the same page and see an error message, 'Invalid entries, please try again'" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "not_my_password"
        fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my organization name it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        # fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my phone number it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        # fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my email it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        # fill_in "email", with: "test@gmail.com"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my description it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "phone", with: "3333333333"
        fill_in "email", with: "test@gmail.com"
        # fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content("Invalid entries, please try again")
      end
    end
  end
end
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
        # expect(page).to have_content("Choose a username")
        # expect(page).to have_field("username")
        # expect(page).to have_content("Enter a password")
        # expect(page).to have_field("password")
        # expect(page).to have_content("Confirm the password")
        # expect(page).to have_field("password_verify")
        expect(page).to have_content("Organization name")
        expect(page).to have_field("name")
        expect(page).to have_content("Street")
        expect(page).to have_field("street")
        expect(page).to have_content("City")
        expect(page).to have_field("city")
        expect(page).to have_content("State")
        expect(page).to have_field("state")
        expect(page).to have_content("Zipcode")
        expect(page).to have_field("zipcode")
        expect(page).to have_content("Contact phone")
        expect(page).to have_field("phone")
        expect(page).to have_content("Description of services")
        expect(page).to have_field("description")
        expect(page).to have_content("Fees")
        expect(page).to have_field("fees")
        expect(page).to have_content("Schedule")
        expect(page).to have_field("schedule")
        expect(page).to have_button("Create Account")
      end

      it "HAPPY PATH:  If I fill in a valid username and passwords and information then I am directed to a Dashboard page '/register/providers/id'" do
        provider_info = {"username"=>"my_username", "password"=>"my_password", "password_verify"=>"my_password", "name"=>"Housing Option", "street"=>"123 Street Street", "city"=>"Townsville", "state"=>"UI", "zipcode"=>"11111", "phone"=>"3334445555", "description"=>"I have housing"}

        # stub_request(:post, 'https://ancient-reaches-38594-79ad833137d5.herokuapp.com/api/v0//api/v0/providers')
        #   .to_return(status: 302, headers: { 'Location' => "https://next-steps-front-end-4778e35e4143.herokuapp.com/register/providers/1" })

        fill_in "name", with: "Housing Option"
        fill_in "description", with: "I have housing"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "AZ"
        fill_in "zipcode", with: "11111"
        fill_in "fees", with: "10"
        fill_in "schedule", with: "24/7"
        fill_in "phone", with: "3334445555"

        click_button "Create Account"

        expect(page).to have_content("Provider Dashboard")
      end

      # before do

      # end

      xit "SAD PATH:  If I fail to fill in a username , I remain on the same page and see an error message, 'Invalid entries, please try again'" do
        # fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"

        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end
      
      xit "SAD PATH:  If I fail to fill in a password or password verification, I remain on the same page and see an error message, 'Invalid entries, please try again'" do
        fill_in "username", with: "my_username"
        # fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")

        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        # fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH:  If my passwords do not match, I remain on the same page and see an error message, 'Invalid entries, please try again'" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "not_my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my organization name it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        # fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my street it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        # fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my city it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        # fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my state it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        # fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my zipcode it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        # fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my phone number it errors" do
        fill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        # fill_in "phone", with: "3334445555"
        fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end

      xit "SAD PATH: If I do not fill in my description it errors" do
        ffill_in "username", with: "my_username"
        fill_in "password", with: "my_password"
        fill_in "password_verify", with: "my_password"
        fill_in "name", with: "Housing Option"
        fill_in "street", with: "123 Street Street"
        fill_in "city", with: "Townsville"
        fill_in "state", with: "UI"
        fill_in "zipcode", with: "11111"
        fill_in "phone", with: "3334445555"
        # fill_in "description", with: "I have housing"

        click_button "Create Account"
  
        expect(current_path).to eq(new_register_provider_path)
        expect(page).to have_content("Invalid entries, please try again")
      end
    end
  end
end
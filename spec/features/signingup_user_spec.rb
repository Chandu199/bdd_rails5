require "rails_helper"
RSpec.feature "Sign Up users" do
    scenario"Signup with valid credentials"do
        visit "/"
        click_link "Signup"
        fill_in "Email",with:"user@example.com"
        fill_in "Password",with:"password"
        fill_in "Password confirmation",with:"password"
        click_button "Sign up"
        
        expect(page).to have_content("Welcome! You have signed up successfully.")
    end
    scenario"SignUp with invalid credentials" do
        visit "/"
        click_link "Signup"
        fill_in "Email",with:""
        fill_in "Password",with:""
        fill_in "Password confirmation",with:""
        click_button "Sign up"
        
        # expect(page).to have_content("You have not Signed up successfully")
    end
end
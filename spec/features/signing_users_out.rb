require "rails_helper"
RSpec.feature "Signing out signed in users" do
    before do
        @john= User.create(email:"john@example.com",password:"password")
        visit "/"
        click_link "Signin"
        fill_in "Email",with: @john.email
        fill_in "Password", with: @john.password
        click_button "Log in"
    end
    
    scenario do
        visit "/"
        click_link "Signout"
        expect(page).to have_content("Signed out successfully")
        expect(page).not_to have_content("Signout")
    end
end
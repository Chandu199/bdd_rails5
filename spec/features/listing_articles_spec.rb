require 'rails_helper'

RSpec.feature "Listing Articles" do
    
    before do 
        john = User.create(email:"john@example.com",password:"password")
         @article1 = Article.create(title:"First Article", body:"This is the test article",user: john)
         @article2 = Article.create(title:"second Article", body:"This is the test article of second",user: john)
    end
    
    scenario"A user lists all articles"do
        visit"/"
        expect(page).to have_content(@article1.title)
        expect(page).to have_content(@article1.body)
        expect(page).to have_content(@article2.title)
        expect(page).to have_content(@article2.body)
        expect(page).to have_link(@article1.title)
        expect(page).to have_link(@article2.title)
        
    end
    
    scenario"A user has no articles"do
        Article.delete_all
        visit"/"
        expect(page).not_to have_content(@article1.title)
        expect(page).not_to have_content(@article1.body)
        expect(page).not_to have_content(@article2.title)
        expect(page).not_to have_content(@article2.body)
        expect(page).not_to have_link(@article1.title)
        expect(page).not_to have_link(@article2.title)
        within("h1#no-articles")do
            expect(page).to have_content("No articles created")
        end
        
    end
end
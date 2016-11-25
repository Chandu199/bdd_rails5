require "rails_helper"
RSpec.feature "Showing an article" do
    
    before do
        @john= User.create(email:"john@example.com",password:"password")
        @fred = User.create(email:"fred@example.com",password:"password")
        @article = Article.create(title:"First Article", body:"This is the test article",user: @john)
    end
    
    scenario"to non signed in user hide edit and delete button" do
        visit"/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
    end
    
    scenario"to non-owner  hide edit and delete button" do
        login_as(@fred)
        visit"/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
    end
    scenario"to owner  show edit and delete button" do
        login_as(@john)
        visit"/"
        click_link @article.title
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
        expect(page).to have_link("Edit Article")
        expect(page).to have_link("Delete Article")
    end
    
end
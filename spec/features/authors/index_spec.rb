require 'rails_helper'

describe 'Authors index page' do
  before do
    @author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    @author2 = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
    @book1 = Book.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction", author_id: @author1.id)
    visit '/authors'
  end

  describe 'when I visit a authors index page' do
    it "I see the name of each parent record in the system" do
      expect(page).to have_content(@author1.name)
      expect(page).to have_content(@author2.name)

    end
  end

    it "authors ordered by most recently created" do
      expect(@author2.name).to appear_before(@author1.name)

    end

    it 'I see a link at the top of the page that takes me to the Child Index' do
      expect(page).to have_link('Book', href: "/books")
      click_link "Book"
      expect(page).to have_content(@book1.name)
    end
end

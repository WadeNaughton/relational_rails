require 'rails_helper'

describe 'Books index page' do
  before do
    @author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    @author2 = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
    @book1 = Book.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction", author_id: @author1.id)
    @book2 = Book.create!(hardcover:false, pages:200, name:"Wade's Book", genre:"Fiction", author_id: @author2.id)
    visit '/books'
  end

  describe 'when I visit a books index page' do
    it "I see each Child in the system including the Child's attributes" do
      expect(page).to have_content(@book1.name)
      expect(page).to have_content(@book2.name)
      expect(page).to have_content(@book1.hardcover)
      expect(page).to have_content(@book2.hardcover)
      expect(page).to have_content(@book1.pages)
      expect(page).to have_content(@book2.pages)
      expect(page).to have_content(@book1.genre)
      expect(page).to have_content(@book2.genre)

    end
  end
end

require 'rails_helper'
describe 'the author show page' do

  before do
    @author = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    @book1 = Book.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction", author_id: @author.id)
    visit "/authors/#{@author.id}"
  end
  it 'I see the parent with that id including the parents attributes' do
    expect(page).to have_content(@author.name)
    expect(page).to have_content(@author.age)
    expect(page).to have_content(@author.award_winning)

  end

  it "I see a count of the number of children associated with this parent" do
    expect(page).to have_content("Number of books: #{@author.count_books}")

  end

  it 'I see a link at the top of the page that takes me to the Child Index' do
    expect(page).to have_link('Book', href: "/books")
    click_link "Book"
    expect(page).to have_content(@book1.name)
  end
end

require 'rails_helper'
describe 'the author show page' do

  before do
    @author = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    @book = Book.create!(hardcover:true, pages:300, name:"Dune", genre:"Science Fiction", author_id: @author.id)
    visit "/books/#{@book.id}"
  end
  it 'I see the child with that id including the childs attributes' do
    expect(page).to have_content(@book.name)

  end

  it 'I see a link at the top of the page that takes me to the Child Index' do
    expect(page).to have_link('Book', href: "/books")
    click_link "Book"
    expect(page).to have_content(@book.name)
  end
end

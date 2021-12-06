require 'rails_helper'
RSpec.describe do
  it "can delete the book from the show page" do
    author = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
    book = Book.create!(hardcover:true, pages:300, name:"Dune", genre:"Science Fiction", author_id: author.id)
    visit "/authors/#{author.id}/books"
    click_button "Delete"
    expect(current_path).to eq('/books')
    expect(page).to_not have_content('Wade Naughton')
    visit "/books"
    expect(page).to_not have_content([book])

  end
end

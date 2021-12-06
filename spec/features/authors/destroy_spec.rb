require 'rails_helper'

RSpec.describe 'destroying an author' do
  it "can delete the author from the index page" do
    author = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
    book = Book.create!(hardcover:true, pages:300, name:"Dune", genre:"Science Fiction", author_id: author.id)
    visit '/authors'
    click_button "Delete"
    expect(current_path).to eq('/authors')
    expect(page).to_not have_content('Wade Naughton')
    visit "/books"
    expect(page).to_not have_content([book])

  end

  it "can delete the author from the show page" do
    author = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
    book = Book.create!(hardcover:true, pages:300, name:"Dune", genre:"Science Fiction", author_id: author.id)
    visit "/authors/#{author.id}"
    click_button "Delete"
    expect(current_path).to eq('/authors')
    expect(page).to_not have_content('Wade Naughton')
    visit "/books"
    expect(page).to_not have_content([book])

  end


end

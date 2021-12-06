require 'rails_helper'

describe 'the book edit' do
  before do
    @author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    @book = Book.create!(hardcover:true, pages:300, name:"Dune", genre:"Science Fiction", author_id: @author1.id)

  end

  it "links to the edit page" do
  visit '/books'
    click_link "Edit #{@book.name}"

    expect(current_path).to eq("/books/#{@book.id}/edit")
  end

  it "links to the edit page from show" do
    visit "/books/#{@book.id}"
    click_link "Edit #{@book.name}"

    expect(current_path).to eq("/books/#{@book.id}/edit")
  end

  it "can edit book" do
    visit '/books'
    expect(page).to have_content("Dune")

    click_link 'Edit Dune'

    expect(current_path).to eq("/books/#{@book.id}/edit")

    fill_in('Name', with: 'Dune new')
    fill_in('Genre', with: 'fiction')
    fill_in('Hardcover', with: 'true')
    fill_in('Pages', with: '600')
    fill_in('Author', with: "#{@author1.id}")


    click_button 'Update Book'

    expect(current_path).to eq("/books/#{@book.id}")
    expect(page).to have_content('Dune new')
  end

  it "can edit book from show page" do
    visit "/books/#{@book.id}"
    expect(page).to have_content("Dune")

    click_link 'Edit Dune'

    expect(current_path).to eq("/books/#{@book.id}/edit")

    fill_in('Name', with: 'Dune new')
    fill_in('Genre', with: 'fiction')
    fill_in('Hardcover', with: 'true')
    fill_in('Pages', with: '600')
    fill_in('Author', with: "#{@author1.id}")


    click_button 'Update Book'

    expect(current_path).to eq("/books/#{@book.id}")
    expect(page).to have_content('Dune new')
  end
end

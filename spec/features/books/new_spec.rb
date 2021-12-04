require 'rails_helper'

RSpec.describe 'the book creation' do
  before do
    @author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
  end
  it "Then I see a link to create a new child record" do
    visit '/books'

    click_link('New Book')
    expect(current_path).to eq('/books/new')
  end

  it "can create a new book" do
    visit '/books/new'

    fill_in('Name', with: 'Da Vinci Code')
    fill_in('Genre', with: 'fiction')
    fill_in('Hardcover', with: 'false')
    fill_in('Pages', with: '500')
    fill_in('Author', with: "#{@author1.id}")
    click_button('Create Book')
    expect(current_path).to eq("/books")
    expect(page).to have_content('Da Vinci Code')

  end
end

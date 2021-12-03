require 'rails_helper'
describe 'the author show page' do

  before do
    @author = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
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
end

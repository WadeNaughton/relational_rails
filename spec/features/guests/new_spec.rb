require 'rails_helper'
describe 'The Guest Creation' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
  end
  it 'links to the new page from the guest index' do
    visit '/guests'
    click_link("New Guest")
    expect(current_path).to eq('/guests/new')
  end

  it 'can creates a new Guest' do
    visit '/guests/new'

    fill_in('Name', with: 'Candice')
    fill_in('Age', with: '22')
    fill_in('New', with: 'true')
    fill_in('Library', with: "#{@library1.id}")
    click_button("Create Guest")


    expect(current_path).to eq("/guests")
    expect(page).to have_content("Candice")
  end
end

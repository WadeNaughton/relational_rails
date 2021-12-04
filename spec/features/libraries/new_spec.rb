require 'rails_helper'
describe 'The Library Creation' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
  end
  it 'links to the new page from the library index' do
    visit '/libraries'
    click_link("New Library")
    expect(current_path).to eq('/libraries/new')
  end

  it 'can createa new Library' do
    visit '/libraries/new'

    fill_in('Name', with: 'Denver Public Library')
    fill_in('City', with: 'Denver')
    fill_in('Open', with: 'true')
    fill_in('Max capacity', with: '223')
    click_button("Create Library")


    expect(current_path).to eq("/libraries")
    expect(page).to have_content("Denver Public Library")
  end
end

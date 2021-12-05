require 'rails_helper'
describe 'The Library edit' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
  end
  it 'links to the edit page' do
    visit '/libraries'
    click_button "Edit #{@library1.name}"
    expect(current_path).to eq("/libraries/#{@library1.id}/edit")
  end

  it 'can edit the Library' do
    visit "/libraries"
    expect(page).to have_content('Denver Public Library')
    click_button "Edit Denver Public Library"
    fill_in 'name', with: 'Pueblo Public Library'
    fill_in 'city', with: 'Pueblo'
    fill_in 'open', with: 'true'
    fill_in 'max_capacity', with: '99'
    click_button 'Update Library'
    expect(current_path).to eq('/libraries')
    expect(page).to have_content('Pueblo Public Library')
  end
end

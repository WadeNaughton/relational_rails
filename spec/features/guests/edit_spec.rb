require 'rails_helper'
describe 'The Guest edit' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
  end
  it 'links to the edit page' do
    visit '/guests'
    click_button "Edit #{@guest1.name}"
    expect(current_path).to eq("/guests/#{@guest1.id}/edit")
  end

  it 'can edit the Guest' do
    visit "/guests"
    expect(page).to have_content('Charles')
    click_button "Edit Charles"
    fill_in 'name', with: 'Jess'
    fill_in 'age', with: '12'
    fill_in 'new', with: 'true'
    fill_in 'Library', with: "#{@library1.id}"
    click_button 'Update Guest'
    expect(current_path).to eq('/guests')
    expect(page).to have_content('Jess')
  end
end

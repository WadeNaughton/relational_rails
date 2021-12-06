require 'rails_helper'
describe 'Destroying a Guest' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
  end

  it 'can delete the guest from the index page' do
    visit '/guests'
    click_button 'Delete'
    expect(current_path).to eq('/guests')
    expect(page).to_not have_content('Charles')
  end

  it 'can delete the guest from the guest show page' do
    visit "/guests/#{@guest1.id}"
    click_button 'Delete'
    expect(current_path).to eq('/guests')
    expect(page).to_not have_content('Charles')
  end
end

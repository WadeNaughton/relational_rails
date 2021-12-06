require 'rails_helper'
describe 'Destroying a Library' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    visit '/libraries'
  end

  it 'can delete the library from the index page' do
    click_button 'Delete'
    expect(current_path).to eq('/libraries')
    expect(page).to_not have_content('Denver Public Library')
    visit '/guests'
    expect(page).to_not have_content([@guest1])
  end

  it 'can delete the library from the library show page' do
    visit "/libraries/#{@library1.id}"
    click_button 'Delete'
    expect(current_path).to eq('/libraries')
    expect(page).to_not have_content('Denver Public Library')
    visit '/guests'
    expect(page).to_not have_content([@guest1])
  end 
end

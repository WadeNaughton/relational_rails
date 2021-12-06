require 'rails_helper'
describe 'Destroy guests' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    @guest2 = Guest.create!(name:"Candice", age:23, new:true, library_id:@library1.id)
    visit "/libraries/#{@library1.id}/guests"
  end

  it 'can delete the guest from the library guests index page' do
    click_button "Delete #{@guest1.name}"
    expect(current_path).to eq("/guests")
    expect(page).to_not have_content([@guest1])
  end
end

require 'rails_helper'
describe 'the guest show page' do

  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    @guest2 = Guest.create!(name:"Chelsea", age:23, new:true, library_id:@library2.id)
    visit "/guests/#{@guest1.id}"
  end
  it 'I see the child with that id including the childs attributes' do
    expect(page).to have_content(@guest1.name)
    expect(page).to have_content(@guest1.age)
    expect(page).to have_content(@guest1.id)
  end
end

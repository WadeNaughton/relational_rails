require 'rails_helper'
describe 'the library show page' do

  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    visit "/libraries/#{@library1.id}"
  end
  it 'I see the parent with that id including the parents attributes' do
    expect(page).to have_content(@library1.name)
    expect(page).to have_content(@library1.city)
    expect(page).to have_content(@library1.max_capacity)
    expect(page).to have_content(@library1.id)
  end

  it 'I see a count of the number of children associated with this parent' do
    expect(page).to have_content("number of guests: #{@library1.count_guests}")
  end

  it 'I see a link at the top of the page that takes me to the Child Index' do
    expect(page).to have_link('Guest', href: "/guests")
    click_link "Guests"
    expect(page).to have_content(@guest1.name)
  end

  it 'I see a link at the top of the page that takes me to the Parent Index' do
    expect(page).to have_link('Libraries', href: "/libraries")
    click_link "Libraries"
    expect(page).to have_content(@library1.name)
  end
end

require 'rails_helper'
describe 'the library show page' do

  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    visit "/libraries/#{@library1.id}"
  end
  it 'I see the parent with that id including the parents attributes' do
    expect(page).to have_content(@library1.name)
    expect(page).to have_content(@library1.city)
    expect(page).to have_content(@library1.max_capacity)
    expect(page).to have_content(@library1.id)
  end
  end

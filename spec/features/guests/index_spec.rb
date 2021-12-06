require 'rails_helper'
describe 'Guests index page' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    @guest2 = Guest.create!(name:"Chelsea", age:23, new:false, library_id:@library2.id)
    visit '/guests'
  end

  describe 'when I visit a guests index page' do
    it 'I see each Child in the system including the Childs attributes' do
      expect(page).to have_content(@guest1.name)
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

    it 'I only see records where Library is open' do
      expect(page).to have_content(@guest1.name)
      expect(page).to have_no_content(@guest2.name)
    end
  end
end

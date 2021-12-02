require 'rails_helper'
describe 'Libraries index page' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
    visit '/libraries/'
  end

  describe 'when I visit a libraries index page' do
    it 'I see the name of each parent record in the system' do
      expect(page).to have_content(@library1.name)
      expect(page).to have_content(@library2.name)
    end
  end
end

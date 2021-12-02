require 'rails_helper'
describe 'Guests index page' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    @guest2 = Guest.create!(name:"Chelsea", age:23, new:true, library_id:@library2.id)
    visit "/libraries/#{@library1.id}/guests"
  end

  describe 'when I visit a libraries guests index page' do
    it 'I see each Child that is associated with that Parent with each Childs attributes' do
      expect(page).to have_content(@guest1.name)
      expect(page).to have_content(@guest1.age)
    end
  end
end

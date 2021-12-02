require 'rails_helper'
describe 'Guests index page' do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    @guest2 = Guest.create!(name:"Chelsea", age:23, new:true, library_id:@library2.id)
    visit '/guests'
  end
  # let(:library1) {Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)}
  # let(:library2) {Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)}
  # let(:guest1) {Guest.create!(name:"Charles", age:12, new:true, library_id: library1.id)}
  # let(:guest2) {Guest.create!(name:"Chelsea", age:23, new:true, library_id: library2.id)}

  describe 'when I visit a guests index page' do
    it 'I see each Child in the system including the Childs attributes' do
      expect(page).to have_content(@guest1.name)
      expect(page).to have_content(@guest2.name)
    end
  end
end

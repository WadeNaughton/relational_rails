require 'rails_helper'
describe Guest do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:false, max_capacity:323)
    @guest1 = Guest.create!(name:"Charles", age:12, new:true, library_id:@library1.id)
    @guest2 = Guest.create!(name:"Chelsea", age:23, new:false, library_id:@library2.id)
  end

  describe "relations" do
    it { should belong_to :library }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }

  end

  it '#true_records' do
    expect(Guest.true_records).to eq([@guest1])
  end
end

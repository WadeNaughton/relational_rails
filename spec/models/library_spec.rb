require 'rails_helper'
describe Library do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:false, max_capacity:323)
    @guest1 = Guest.create!(name:"Lindsey", age:12, new:true, library_id:@library1.id)
    @guest2 = Guest.create!(name:"Chelsea", age:23, new:true, library_id:@library2.id)
    @guest3 = Guest.create!(name:"Charles", age:44, new:false, library_id:@library2.id)
  end
  describe "relations" do
    it { should have_many :guests }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :max_capacity }

  end

  it '#order_by' do
    expect(Library.order_by).to eq([@library2, @library1])
  end

  it '#count_guests' do
    expect(@library1.count_guests).to eq(1)
    expect(@library2.count_guests).to eq(2)
  end

  it '#alphabetical' do
    expect(@library2.alphabetical).to eq([@guest3, @guest2])
  end

end

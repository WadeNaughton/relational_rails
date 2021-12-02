require 'rails_helper'
describe Library do
  before do
    @library1 = Library.create!(name:"Denver Public Library", city: "Denver", open:true, max_capacity:500)
    @library2 = Library.create!(name:"Fort Collins Public Library", city: "Fort Collins", open:true, max_capacity:323)
  end
  describe "relations" do
    it { should have_many :guests }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :max_capacity }

  end

  it '#sort' do
    expect(Library.order_by).to eq([@library2, @library1])
  end
end

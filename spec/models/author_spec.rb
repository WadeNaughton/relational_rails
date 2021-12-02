require 'rails_helper'
describe Author do
  describe "relations" do
    it { should have_many :books }
  end

  describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :age }

 end

 it "orders by created_at" do

   author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
   author2 = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
   expect(Author.order_by).to eq([author2, author1])

 end

end

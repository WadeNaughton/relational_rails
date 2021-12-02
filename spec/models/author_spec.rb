require 'rails_helper'
describe Author do
  describe "relations" do
    it { should have_many :books }
  end

  describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :age }
  
 end

end

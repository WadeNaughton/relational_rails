require 'rails_helper'
describe Library do
  describe "relations" do
    it { should have_many :guests }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :max_capacity }
    
  end

end

require 'rails_helper'
describe Guest do
  describe "relations" do
    it { should belong_to :library }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :new }
  end
end

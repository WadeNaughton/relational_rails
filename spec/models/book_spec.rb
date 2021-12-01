require 'rails_helper'
describe Book do
  describe "relations" do
    it { should belong_to :author }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :genre }
    it { should validate_presence_of :pages}
    it { should validate_presence_of :hardcover}
  
  end
end

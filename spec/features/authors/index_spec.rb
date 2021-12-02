require 'rails_helper'

describe 'Authors index page' do
  before do
    @author1 = Author.create(award_winning:true, age:35, name:"Frank Herbert")
    @author2 = Author.create(award_winning:false, age:30, name:"Wade Naughton")
    visit '/authors'
  end

  describe 'when I visit a authors index page' do
    it "I see the name of each parent record in the system" do
      expect(page).to have_content(@author1.name)
      expect(page).to have_content(@author2.name)

    end
  end
end

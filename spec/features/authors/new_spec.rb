require 'rails_helper'

RSpec.describe 'the artist creation' do
  before do
    @author = Author.create(award_winning:true, age:35, name:"Frank Herbert")
  end
  it "Then I see a link to create a new Parent record" do
    visit '/authors'

    click_link('New Author')
    expect(current_path).to eq('/authors/new')
  end

  it "can create a new author" do

    visit '/authors/new'

    fill_in('Name', with: 'Frank Herbert')
    fill_in('award_winning', with: 'true')
    fill_in('age', with: '35')
    click_button('Create Author')
    expect(current_path).to eq("/authors")
    expect(page).to have_content("Frank Herbert")

  end
end

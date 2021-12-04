require 'rails_helper'

RSpec.describe 'the artist creation' do
  it "Then I see a link to create a new Parent record" do
    visit '/authors'

    click_link('New Author')
    expect(current_path).to eq('/authors/new')
  end

  it "can create a new author" do
    visit '/authors/new'

    fill_in('Name', with: 'Dan Brown')
    click_button('Create Author')
    expect(current_path).to eq("/authors")
    expect(page).to have_content("Dan Brown")

  end
end

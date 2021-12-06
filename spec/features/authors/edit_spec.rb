require 'rails_helper'

describe 'the author edit' do
  before do
    @author = Author.create!(award_winning:true, age:35, name:"Frank Herbert")

  end

  it "links to the edit page" do
    visit '/authors'
    click_link "Edit #{@author.name}"

    expect(current_path).to eq("/authors/#{@author.id}/edit")
  end

  it "links to the edit page from show" do
    visit "/authors/#{@author.id}"
    click_link "Edit #{@author.name}"

    expect(current_path).to eq("/authors/#{@author.id}/edit")
  end

  it "can edit author" do
    visit '/authors'
    expect(page).to have_content("Frank Herbert")

    click_link 'Edit Frank Herbert'

    expect(current_path).to eq("/authors/#{@author.id}/edit")

    fill_in('Name', with: 'Wade Naughton')
    fill_in('Award winning', with: 'true')
    fill_in('Age', with: '30')

    click_button 'Update Author'

    expect(current_path).to eq("/authors/#{@author.id}")
    expect(page).to have_content('Wade Naughton')
  end

  it "can edit author from show page" do
    visit "/authors/#{@author.id}"
    expect(page).to have_content("Frank Herbert")

    click_link 'Edit Frank Herbert'

    expect(current_path).to eq("/authors/#{@author.id}/edit")

    fill_in('Name', with: 'Wade Naughton')
    fill_in('Award winning', with: 'true')
    fill_in('Age', with: '30')

    click_button 'Update Author'

    expect(current_path).to eq("/authors/#{@author.id}")
    expect(page).to have_content('Wade Naughton')
  end
end

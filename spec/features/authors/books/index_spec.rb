require 'rails_helper'

RSpec.describe ' Authors books index' do
  it "shows all of the books for an author" do
    frank = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    dune = frank.books.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction")
    dune_messiah = frank.books.create!(hardcover:false, pages:400, name:"Dune Messiah", genre:"Science Fiction")

    visit "/authors/#{frank.id}/books"

    expect(page).to have_content(dune.name)
    expect(page).to have_content(dune_messiah.name)
    expect(page).to have_content(dune.hardcover)
    expect(page).to have_content(dune_messiah.hardcover)
    expect(page).to have_content(dune.pages)
    expect(page).to have_content(dune_messiah.pages)
    expect(page).to have_content(dune.genre)
    expect(page).to have_content(dune_messiah.genre)
  end
end

require 'rails_helper'

RSpec.describe ' Authors books index' do
  before do
    @frank = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    @wade = Author.create!(award_winning:true, age:35, name:"wade")
    @dune = @wade.books.create!(hardcover:true, pages:301, name:"wade", genre:"Science Fiction")
    @dune = @frank.books.create!(hardcover:true, pages:299, name:"Dune", genre:"Science Fiction")
    @dune_messiah = @frank.books.create!(hardcover:true, pages:400, name:"Messiah", genre:"Science Fiction")
    visit "/authors/#{@frank.id}/books"
  end

  it "shows all of the books for an author" do

    expect(page).to have_content(@dune.name)
    expect(page).to have_content(@dune_messiah.name)
    expect(page).to have_content(@dune.hardcover)
    expect(page).to have_content(@dune_messiah.hardcover)
    expect(page).to have_content(@dune.pages)
    expect(page).to have_content(@dune_messiah.pages)
    expect(page).to have_content(@dune.genre)
    expect(page).to have_content(@dune_messiah.genre)
  end

  it 'I see a link at the top of the page that takes me to the Child Index' do

    expect(page).to have_link("Books", href: '/books')
    click_link "Books"
    expect(page).to have_content(@dune_messiah.name)
  end

  it "links to author_books index" do
    expect(page).to have_link("Alphabetical Order", href: "/authors/#{@frank.id}/books?sort=asc")
  end

  it "lists books in alphabetical order" do
    click_link "Alphabetical Order"
    expect(@dune.name).to appear_before(@dune_messiah.name)
  end

  it "I see a form that takes a numerical input and limits book greater than 301 pages" do

    fill_in "Books Longer Than", with: 300
    click_button "Apply"

    expect(page).to_not have_content("Dune")
    expect(page).to_not have_content("wade")
  end
end

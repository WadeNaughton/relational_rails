require 'rails_helper'

RSpec.describe ' Authors books index' do
  before do
    @frank = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    @dune = @frank.books.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction")
    @dune_messiah = @frank.books.create!(hardcover:true, pages:400, name:"Dune Messiah", genre:"Science Fiction")
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
end

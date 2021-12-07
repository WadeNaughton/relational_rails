require 'rails_helper'
describe Author do
  describe "relations" do
    it { should have_many :books }
  end

  describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :age }

 end

 it "orders by created_at" do

   author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
   author2 = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
   expect(Author.order_by).to eq([author2, author1])

 end

 it "counts number of books associated with author" do
   author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
   author2 = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
   book1 = author1.books.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction")
   book2 = author2.books.create!(hardcover:false, pages:200, name:"Wade's Book", genre:"Fiction")
   book3 = author1.books.create!(hardcover:false, pages:200, name:"Dune Messiah", genre:"Fiction")

   expect(author1.count_books).to eq(2)
   expect(author2.count_books).to eq(1)
 end

 it "orders an authors books alphabetically" do
   author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")

   book1 = author1.books.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction")
   book2 = author1.books.create!(hardcover:false, pages:200, name:"Wade's Book", genre:"Fiction")
   book3 = author1.books.create!(hardcover:false, pages:200, name:"Dune Messiah", genre:"Fiction")
   expect(author1.alphabetical).to eq([book1, book3, book2])
 end


  it '#page_filter' do
    author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    book1 = author1.books.create!(hardcover:false, pages:300, name:"Dune", genre:"Science Fiction")
    book2 = author1.books.create!(hardcover:false, pages:200, name:"Wade's Book", genre:"Fiction")
    book3 = author1.books.create!(hardcover:false, pages:200, name:"Dune Messiah", genre:"Fiction")
    expect(author1.page_filter(200)).to eq([book1])
  end


end

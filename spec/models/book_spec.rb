require 'rails_helper'
describe Book do
  describe "relations" do
    it { should belong_to :author }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :genre }
    it { should validate_presence_of :pages}


  it "only returns hardcover books" do
    author1 = Author.create!(award_winning:true, age:35, name:"Frank Herbert")
    author2 = Author.create!(award_winning:false, age:30, name:"Wade Naughton")
    book1 = Book.create!(hardcover:true, pages:300, name:"Dune", genre:"Science Fiction", author_id: author1.id)

    expect(Book.true_book).to eq([book1])

  end

  end
end

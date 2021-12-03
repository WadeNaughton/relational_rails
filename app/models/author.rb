class Author < ApplicationRecord

  has_many :books

    validates_presence_of :name
    validates_presence_of :age
    validates :award_winning, inclusion: [true, false]

  def self.order_by
    Author.order(created_at: :desc)
  end

  def count_books
    Book.where(author_id: self.id).count
  end

end

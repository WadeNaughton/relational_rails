class Author < ApplicationRecord

  has_many :books, :dependent => :destroy

  validates :name, presence: true
  validates :age, presence: true
  validates :award_winning, inclusion: [true, false]

  def self.order_by
    Author.order(created_at: :desc)
  end

  def count_books
    books.where(author_id: self.id).count
  end

  def alphabetical
    books.order(:name)
  end

  def page_filter(pages)
    books.where("pages > ?", pages)
  end
end

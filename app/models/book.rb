class Book < ApplicationRecord

  belongs_to :author

  validates_presence_of :name
  validates_presence_of :genre
  validates_presence_of :pages
  validates :hardcover, inclusion: [true, false]

  def self.true_book
    Book.where(hardcover: true)
  end

end

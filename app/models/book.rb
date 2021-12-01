class Book < ApplicationRecord

  belongs_to :author

  validates_presence_of :name
  validates_presence_of :genre
  validates_presence_of :pages
  validates :hardcover, inclusion: [true, false]

end

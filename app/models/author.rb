class Author < ApplicationRecord

  has_many :books

    validates_presence_of :name
    validates_presence_of :age
    validates :award_winning, inclusion: [true, false]

end

class Guest < ApplicationRecord
  belongs_to :library

  validates_presence_of :name, :age, :new
end

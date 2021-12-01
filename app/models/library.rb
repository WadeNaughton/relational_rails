class Library < ApplicationRecord
  has_many :guests

  validates_presence_of :name, :city, :max_capacity, :open
end

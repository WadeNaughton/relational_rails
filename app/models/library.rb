class Library < ApplicationRecord
  has_many :guests

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :max_capacity
  validates :open, inclusion: [true, false]
end

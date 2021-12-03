class Library < ApplicationRecord
  has_many :guests

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :max_capacity
  validates :open, inclusion: [true, false]

  def self.order_by
    Library.order(created_at: :desc)
  end

  def count_guests
    Guest.where(library_id: self.id).count 
  end
end

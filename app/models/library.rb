class Library < ApplicationRecord
  has_many :guests, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :max_capacity
  validates :open, inclusion: [true, false]

  def self.order_by
    Library.order(created_at: :desc)
  end

  def count_guests
    guests.where(library_id: self.id).count
  end

  def alphabetical
    guests.order(:name)
  end

  def age_filter(age)
    guests.where("age > ?", age)
  end
end

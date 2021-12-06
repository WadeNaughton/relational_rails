class Guest < ApplicationRecord
  belongs_to :library

  validates_presence_of :name
  validates_presence_of :age
  validates :new, inclusion: [true, false]

  def self.true_records
    Guest.where(new: true)
  end
end

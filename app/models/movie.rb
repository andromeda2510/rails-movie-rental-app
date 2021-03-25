class Movie < ApplicationRecord
  enum status: {
    available: 0,
    rented: 1
  }

  belongs_to :user, optional: true
  belongs_to :category

  validates :name, presence: true
  validates :director, presence: true
end

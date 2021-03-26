class Movie < ApplicationRecord
  enum status: {
    available: 0,
    rented: 1
  }

  attribute :status, :integer, default: 0

  belongs_to :user, optional: true
  belongs_to :category

  validates :name, presence: true
  validates :director, presence: true

  paginates_per 4
end

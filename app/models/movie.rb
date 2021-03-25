class Movie < ApplicationRecord
  enum status: {
    not_rented: 0,
    rented: 1
  }

  belongs_to :user_id
  belongs_to :category_id

  validates :name, presence: true
  validates :director, presence: true
end

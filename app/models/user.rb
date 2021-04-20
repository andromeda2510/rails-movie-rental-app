class User < ApplicationRecord
  has_many :movies, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

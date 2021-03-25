class User < ApplicationRecord
  has_many :movies

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

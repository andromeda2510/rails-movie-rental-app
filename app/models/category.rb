class Category < ApplicationRecord
  has_many :movies, dependent: :nullify
end

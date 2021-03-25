class AddCategoryRefToMovies < ActiveRecord::Migration[6.1]
  def change
    add_reference :movies, :category, foreign_key: true
  end
end

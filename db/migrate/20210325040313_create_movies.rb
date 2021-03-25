class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.date :release_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

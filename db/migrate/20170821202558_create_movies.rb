class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :genre_id, array: true, default: []
      t.string :smaller_poster
      t.string :poster
      t.string :overview
      t.string :release_date
      t.string :rating
      t.timestamps
    end
  end
end

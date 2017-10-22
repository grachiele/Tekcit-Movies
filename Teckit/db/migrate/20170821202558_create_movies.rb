class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :genre_id
      t.string :thumbnail
      t.string :full_image
      t.timestamps
    end
  end
end

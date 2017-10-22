class CreateMovieTheatres < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_theatres do |t|
      t.string :name
      t.string :thumbnail
      t.string :full_image
      t.integer :city_id
      t.timestamps
    end
  end
end

class CreateShowtimes < ActiveRecord::Migration[5.1]
  def change
    create_table :showtimes do |t|
      t.string :show_date
      t.string :start_time
      t.integer :movie_id
      t.integer :movie_theatre_id

      t.timestamps
    end
  end
end

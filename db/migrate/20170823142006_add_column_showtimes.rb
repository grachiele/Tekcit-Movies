class AddColumnShowtimes < ActiveRecord::Migration[5.1]
  def change
    add_column :showtimes, :tickets_left
  end
end

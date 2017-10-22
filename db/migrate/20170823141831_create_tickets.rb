class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :showtime_id
      t.timestamps
    end
  end
end

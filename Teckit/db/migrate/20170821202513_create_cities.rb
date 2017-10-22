class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :thumbnail
      t.string :full_image
      t.timestamps
    end
  end
end

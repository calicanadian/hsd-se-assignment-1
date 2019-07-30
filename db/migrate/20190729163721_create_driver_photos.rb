class CreateDriverPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_photos do |t|
      t.integer :driver_id
      t.integer :photo_id

      t.timestamps
    end
  end
end

class CreateDriverRides < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_rides do |t|
      t.integer :driver_id
      t.integer :ride_id

      t.timestamps
    end
  end
end

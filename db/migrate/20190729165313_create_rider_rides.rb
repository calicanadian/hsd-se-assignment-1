class CreateRiderRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rider_rides do |t|
      t.integer :rider_id
      t.integer :ride_id

      t.timestamps
    end
  end
end

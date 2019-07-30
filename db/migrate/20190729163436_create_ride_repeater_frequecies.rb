class CreateRideRepeaterFrequecies < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_repeater_frequencies do |t|
      t.integer :ride_repeater_id
      t.integer :ride_frequency_id
      t.integer :ride_id
      t.integer :user_id
      t.integer :driver_id

      t.timestamps
    end
  end
end

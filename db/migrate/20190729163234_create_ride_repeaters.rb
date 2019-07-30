class CreateRideRepeaters < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_repeaters do |t|
      t.integer :ride_id
      t.integer :ride_frequency_id
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end

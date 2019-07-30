class CreateDriverCars < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_cars do |t|
      t.integer :driver_id
      t.integer :car_id

      t.timestamps
    end
  end
end

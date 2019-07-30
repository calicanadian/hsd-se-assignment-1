class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.string :year
      t.integer :number_of_seats
      t.string :insurance_provider
      t.string :registration_year
      t.string :registration_month
      t.datetime :registration_expiration
      t.integer :driver_id

      t.timestamps
    end
  end
end

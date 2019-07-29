class CreateRideFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_frequencies do |t|
      t.string :name
      t.string :description
      t.string :designation

      t.timestamps
    end
  end
end

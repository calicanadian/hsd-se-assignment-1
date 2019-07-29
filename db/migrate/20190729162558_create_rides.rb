class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.numeric :pick_up_location
      t.numeric :drop_off_location
      t.integer :organizer_id
      t.boolean :is_carpool
      t.datetime :pick_up_time

      t.timestamps
    end
  end
end

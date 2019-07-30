class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.numeric :pick_up_longitude
      t.numeric :pick_up_lattitude
      t.numeric :drop_off_longitude
      t.numeric :drop_off_lattitude
      t.integer :user_id
      t.boolean :is_carpool
      t.datetime :pick_up_time

      t.timestamps
    end
  end
end

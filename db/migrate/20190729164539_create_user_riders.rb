class CreateUserRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :user_riders do |t|
      t.integer :user_id
      t.integer :rider_id

      t.timestamps
    end
  end
end

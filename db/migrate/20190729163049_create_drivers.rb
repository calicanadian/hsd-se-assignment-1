class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :gender
      t.text :bio
      t.integer :photo_id
      t.integer :car_id

      t.timestamps
    end
  end
end

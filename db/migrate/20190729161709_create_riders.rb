class CreateRiders < ActiveRecord::Migration[5.2]
  def change
    create_table :riders do |t|
      t.string :first_name
      t.string :last_name
      t.string :secret_word
      t.integer :photo_id
      t.string :gender
      t.string :age

      t.timestamps
    end
  end
end

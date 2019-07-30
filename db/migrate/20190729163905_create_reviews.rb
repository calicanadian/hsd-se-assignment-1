class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :star_count
      t.string :description
      t.text :text
      t.integer :user_id
      t.integer :driver_id

      t.timestamps
    end
  end
end

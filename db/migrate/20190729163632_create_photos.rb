class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :url
      t.string :file
      t.string :filename
      t.integer :filesize
      t.string :filetype
      t.string :bucket
      t.string :domain

      t.timestamps
    end
  end
end

class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :tag_line
      t.string :image
      t.references :img_album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

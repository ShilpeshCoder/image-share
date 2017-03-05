class CreateImgAlbums < ActiveRecord::Migration
  def change
    create_table :img_albums do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

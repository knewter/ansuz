class AddPhotoAlbumsAndPhotoAlbumPhotos < ActiveRecord::Migration
  def self.up
    create_table :photo_albums do |t|
      t.string :name
    end

    create_table :photo_album_photos do |t|
      t.integer :photo_album_id
      t.string  :title
      t.text    :caption
      t.string  :photo_album_photo_image_file_name
      t.string  :photo_album_photo_image_content_type
      t.integer :photo_album_photo_image_file_size
    end
  end

  def self.down
    drop_table :photo_album_photos

    drop_table :photo_albums
  end
end

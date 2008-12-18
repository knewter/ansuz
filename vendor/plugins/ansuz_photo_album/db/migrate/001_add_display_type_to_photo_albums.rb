class AddDisplayTypeToPhotoAlbums < ActiveRecord::Migration
  def self.up
    add_column :photo_albums, :display_type, :string
  end

  def self.down
    remove_column :photo_albums, :display_type
  end
end

require 'paperclip'
module Ansuz
  module JAdams
    class PhotoAlbumPhoto < ActiveRecord::Base
      belongs_to :photo_album, :class_name => "Ansuz::JAdams::PhotoAlbum"
      has_attached_file :photo_album_photo_image, 
         :styles => { :large  => "700x>",
                      :medium => "300x300>",
                      :thumb  => "100x100>" }

    end
  end
end

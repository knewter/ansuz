class PhotoAlbumsController < ApplicationController
  before_filter :load_photo_album, :only => [:show, :update]
  before_filter :load_photos,      :only => [:show]
  protected
  def load_photo_album
    @photo_album = Ansuz::JAdams::PhotoAlbum.find(params[:id])
  end

  def load_photos
    @photos = @photo_album.photos
  end
  public
  def show
  end

  def update
  end
end

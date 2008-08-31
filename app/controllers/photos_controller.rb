Ansuz::JAdams::PhotoAlbumPhoto
Ansuz::JAdams::PhotoAlbumPhoto

class PhotosController < ApplicationController
  before_filter :load_photo_album
  before_filter :load_new_photo, :only => [:new, :create]
  protected
  def load_photo_album
    @photo_album = Ansuz::JAdams::PhotoAlbum.find(params[:photo_album_id])
  end

  def load_new_photo
    @photo = @photo_album.photos.build(params[:photo])
  end

  public
  def new
  end

  def create
    if @photo.save
      flash[:notice] = "The photo was saved successfully."
      redirect_to photo_album_path(@photo_album)
    else
      render :action => 'new'
    end
  end
end

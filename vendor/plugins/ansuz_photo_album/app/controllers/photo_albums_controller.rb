class PhotoAlbumsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_photo_album, :only => [:show, :update]
  before_filter :load_photos,      :only => [:show]
  layout 'admin'
  
  protected
  def load_photo_album
    @photo_album = Ansuz::JAdams::PhotoAlbum.find(params[:id])
  end

  def load_photos
    @photos = @photo_album.photos
  end
  public
  def show
    render :layout => false
  end

  def update
  end
end

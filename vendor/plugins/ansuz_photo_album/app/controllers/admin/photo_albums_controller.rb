class Admin::PhotoAlbumsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_photo_album, :only => [:show, :edit, :update]
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
  end

  def edit
  end

  def update
    if @photo_album.update_attributes(params[:photo_album])
      flash[:notice] = "The Photo Album was updated successfully."
      redirect_to admin_photo_album_path(@photo_album)
    else
      flash.now[:error] = "There was a problem updating the photo album."
      render :action => "edit"
    end
  end
end

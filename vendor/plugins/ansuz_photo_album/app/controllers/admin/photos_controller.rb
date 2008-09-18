class Admin::PhotosController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_photo_album
  before_filter :load_new_photo, :only => [:new, :create]
  before_filter :load_photo, :only => [:show, :edit, :update, :destroy]
  protected
  def load_photo_album
    @photo_album = Ansuz::JAdams::PhotoAlbum.find(params[:photo_album_id])
  end

  def load_new_photo
    @photo = @photo_album.photos.build(params[:photo])
  end

  def load_photo
    @photo = @photo_album.photos.find(params[:id])
  end

  public
  def new
  end

  def create
    if @photo.save
      flash[:notice] = "The photo was saved successfully."
      redirect_to admin_photo_album_path(@photo_album)
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Photo was updated succesffully."
      redirect_to admin_photo_album_path(@photo_album)
    else
      flash.now[:error] = "There was a problem updating the photo."
      render :action => "edit"
    end
  end
end

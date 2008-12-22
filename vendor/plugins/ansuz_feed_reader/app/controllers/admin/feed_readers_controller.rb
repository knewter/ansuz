class Admin::FeedReadersController < Admin::BaseController
  unloadable

  before_filter :load_feed_reader, :only => [ :show, :edit, :update ]

  protected
  def load_feed_reader
    @feed_reader = Ansuz::JAdams::FeedReader.find params[:id]
  end

  public
  def show
    redirect_to edit_admin_feed_reader_path(@feed_reader)
  end

  def edit
  end

  def update
    if @feed_reader.update_attributes(params[:feed_reader])
      @feed_reader.settings = params[:settings]
      @feed_reader.save
      flash[:notice] = "The feed reader has been updated."
      redirect_to edit_admin_feed_reader_path(@feed_reader)
    else
      flash.now[:error] = "There was a problem updating the feed reader."
      render :action => "edit"
    end
  end
end

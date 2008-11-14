class Admin::PageMetadatasController < Admin::BaseController
  before_filter :load_page
  before_filter :load_page_metadata, :only => [:edit, :update]

  protected
  def load_page
    @page = Page.find(params[:page_id])
  end

  def load_page_metadata
    @page_metadata = @page.page_metadata
  end

  public
  def edit
  end

  def update
    if @page_metadata.update_attributes(params[:page_metadata])
      flash[:notice] = "Metadata was updated successfully."
      redirect_to edit_admin_page_path(@page)
    else
      flash.now[:error] = "There was a problem updating the metadata."
      render :action => 'edit'
    end
  end
end

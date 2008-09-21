class Admin::ScrollableContentSectionsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_scrollable_content
  before_filter :load_new_scrollable_content_section, :only => [:new, :create]
  before_filter :load_scrollable_content_section,     :only => [:show, :edit, :update, :destroy]
  protected
  def load_scrollable_content
    @scrollable_content = Ansuz::JAdams::ScrollableContent.find(params[:scrollable_content_id])
  end

  def load_new_scrollable_content_section
    @scrollable_content_section = @scrollable_content.scrollable_content_sections.build(params[:scrollable_content_section])
  end

  def load_scrollable_content_section
    @scrollable_content_section = @scrollable_content.scrollable_content_sections.find(params[:id])
  end

  public
  def new
  end

  def create
    if @scrollable_content_section.save
      flash[:notice] = "The scrollable content section was saved successfully."
      redirect_to admin_scrollable_content_path(@scrollable_content)
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @scrollable_content_section.update_attributes(params[:scrollable_content_section])
      flash[:notice] = "Scrollable Content Section was updated successfully."
      redirect_to admin_scrollable_content_path(@scrollable_content)
    else
      flash.now[:error] = "There was a problem updating the scrollable content section."
      render :action => "edit"
    end
  end
end

class Admin::ScrollableContentsController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app

  before_filter :load_scrollable_content,  :only => [:show, :update]
  before_filter :load_scrollable_content_sections, :only => [:show]
  layout 'admin'
  
  protected
  def load_scrollable_content
    @scrollable_content = Ansuz::JAdams::ScrollableContent.find(params[:id])
  end

  def load_scrollable_content_sections
    @scrollable_content_sections = @scrollable_content.scrollable_content_sections
  end
  public
  def show
  end

  def update
  end
end

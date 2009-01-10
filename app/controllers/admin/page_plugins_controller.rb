class Admin::PagePluginsController < Admin::BaseController
  before_filter :load_page, :only => [:new, :create]
  before_filter :load_new_page_plugin, :only => [:new, :create]
  before_filter :load_page_plugin, :only => [:edit, :destroy, :move_up, :move_down]

  protected
  def load_page
    @page = Page.find(params[:page_id])
  end

  def load_new_page_plugin
    @page_plugin = PagePlugin.new(params[:page_plugin])
    @page_plugin.page = @page
  end

  def load_page_plugin
    @page_plugin = PagePlugin.find(params[:id])
  end

  public
  def new
    respond_to do |format|
      format.html{ render :layout => false }
    end
  end

  def edit
    redirect_to @page_plugin.module.edit_path
  end

  def create
    if @page_plugin.save
      flash[:notice] = "Successfully saved the Page Plugin"
      redirect_to edit_admin_page_path(@page, :anchor => "page-plugin-#{@page_plugin.id}")
    else
      flash.now[:error] = "There was a problem saving the Page Plugin"
      render :action => 'new'
    end
  end

  def destroy
    @page = @page_plugin.page
    @page_plugin.destroy
    flash[:notice] = "Plugin was removed from the page."
    redirect_to edit_admin_page_path(@page)
  end

  def move_up
    @page_plugin.move_higher
    flash[:notice] = "Plugin was moved up by one"
    redirect_to edit_admin_page_path(@page_plugin.page)
  end

  def move_down
    @page_plugin.move_lower
    flash[:notice] = "Plugin was moved down by one"
    redirect_to edit_admin_page_path @page_plugin.page
  end
end

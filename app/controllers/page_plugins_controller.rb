class PagePluginsController < ApplicationController
  before_filter :load_page, :only => [:new, :create]
  before_filter :load_new_page_plugin, :only => [:new, :create]
  before_filter :load_page_plugin, :only => [:edit]

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
  end

  def edit
    redirect_to @page_plugin.module.edit_path
  end

  def create
    if @page_plugin.save
      flash[:notice] = "Successfully saved the Page Plugin"
      redirect_to '/admin'
    else
      flash.now[:error] = "There was a problem saving the Page Plugin"
      render :action => 'new'
    end
  end
end

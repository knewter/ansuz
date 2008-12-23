class Admin::ProtoPagePluginsController < Admin::BaseController
  before_filter :load_page_plugin, :only => [:update]

  protected
  def load_page_plugin
    @page_plugin = PagePlugin.find(params[:id])
    @module = @page_plugin.module
  end

  public
  def update
    @module.settings = params[:settings]
    if @module.save
      render :update do |page|
        page << "notify('Module has been updated');"
      end
    else
      render :update do |page|
        page << "notify('An error occurred updating the Module');"
      end
    end
  end
end

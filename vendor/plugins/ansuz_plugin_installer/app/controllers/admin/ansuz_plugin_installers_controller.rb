class Admin::AnsuzPluginInstallersController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app
  include PluginsManagementHelper
  helper :plugins_management

  layout 'admin'

  before_filter :load_plugins_listing_var
  before_filter :load_plugins, :only => [:index]

  protected
  def load_plugins_listing_var
    @plugins_util = Ansuz::JAdams::AnsuzPluginsListing
  end

  def load_plugins
    @plugins = @plugins_util.listing
  end

  public
  def index
  end

  # TODO: These should be REST actions probably
  def install
    @plugins_util.install(params[:repository_url], params[:name])
    flash[:notice] = "Plugin installed successfully."
    redirect_to admin_ansuz_plugin_installers_path
  end

  # expects a params[:name]
  def enable
    @plugins_util.enable(params[:name])
    flash[:notice] = "Plugin has been enabled."
    redirect_to admin_ansuz_plugin_installers_path
  end

  # expects a params[:name]
  def disable
    @plugins_util.disable(params[:name])
    flash[:notice] = "Plugin has been disabled."
    redirect_to admin_ansuz_plugin_installers_path
  end

  def update
    @plugins_util.update(params[:id])
    flash[:notice] = "Plugin updated successfully."
    redirect_to admin_ansuz_plugin_installers_path
  end

  def destroy
    @plugins_util.delete(params[:id])
    flash[:notice] = "Plugin deleted successfully."
    redirect_to admin_ansuz_plugin_installers_path
  end
end

class Admin::AnsuzThemeInstallersController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app
  include ThemesManagementHelper
  helper :themes_management

  layout 'admin'

  before_filter :load_themes_listing_var
  before_filter :load_themes, :only => [:index]

  protected
  def load_themes_listing_var
    @themes_util = Ansuz::JAdams::AnsuzThemesListing
  end

  def load_themes
    @themes = @themes_util.listing
  end

  public
  def index
  end

  # TODO: These should be REST actions probably
  def install
    @themes_util.install(params[:repository_url], params[:name])
    flash[:notice] = "Theme installed successfully."
    redirect_to admin_ansuz_theme_installers_path
  end

  def update
    @themes_util.update(params[:id])
    flash[:notice] = "Theme updated successfully."
    redirect_to admin_ansuz_theme_installers_path
  end

  def destroy
    @themes_util.delete(params[:id])
    flash[:notice] = "Theme deleted successfully."
    redirect_to admin_ansuz_theme_installers_path
  end
end

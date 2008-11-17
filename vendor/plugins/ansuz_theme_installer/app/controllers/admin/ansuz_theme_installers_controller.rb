class Admin::AnsuzThemeInstallersController < Admin::BaseController
  unloadable # This is required if you subclass a controller provided by the base rails app
  include ThemesManagementHelper
  helper :themes_management

  layout 'admin'
  before_filter :load_themes,    :only => [:index]

  protected
  def load_themes
    @themes = Ansuz::JAdams::AnsuzThemesListing.listing
  end

  public
  def index
  end

  def install
    Ansuz::JAdams::AnsuzThemesListing.install(params[:repository_url])
    flash[:notice] = "Theme installed successfully."
    redirect_to admin_ansuz_theme_installers_path
  end
end

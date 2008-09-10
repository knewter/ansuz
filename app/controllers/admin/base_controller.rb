class Admin::BaseController < ApplicationController
  before_filter :login_required
  before_filter :load_admin_plugin_nav
  layout 'admin'

  protected
  def load_admin_plugin_nav
    # The plugin nav comes across as an array of arrays like [text, url]
    @admin_plugin_nav = Ansuz::PluginManagerInstance.admin_plugin_nav
  end
end

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include SiteSettingsHelper
  before_filter :login_from_cookie, :setup_plugin_nav, :set_layout_variables
  helper :all
  theme  :get_theme_setting

  def set_layout_variables
    @root = Page.root
    @topNav = @root.publishable_children
    @topNavChildren = Hash.new
    @topNav.each do |sub|
      temp = sub.publishable_children
      @topNavChildren[sub] = temp if temp.length > 0
    end
    @topNav.unshift @root
    @breadcrumb = []
  end

  def setup_plugin_nav
    # The plugin nav comes across as an array of arrays like [text, url]
    @plugin_nav = Ansuz::PluginManagerInstance.plugin_nav
  end
end

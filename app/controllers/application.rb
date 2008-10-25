class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include SiteSettingsHelper
  before_filter :login_from_cookie, :setup_plugin_nav, :set_layout_variables, :load_menu
  helper :all, :testimonials
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

  def load_menu
    @menu_menu_entries = Ansuz::JAdams::MenuEntry.root_entries
    if @menu_menu_entries.empty?
      # Set up a default menu if there isn't one
      Ansuz::JAdams::MenuEntry.create(:name => 'pages', :link => 'special')
    end
  end

  def setup_plugin_nav
    # The plugin nav comes across as an array of arrays like [text, url]
    @plugin_nav = Ansuz::PluginManagerInstance.plugin_nav
  end
end

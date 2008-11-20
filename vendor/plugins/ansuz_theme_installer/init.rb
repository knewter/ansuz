# Include hook code here
require 'ansuz/jadams/ansuz_themes_listing'
Ansuz::PluginManagerInstance.register_admin_menu_entry('Manage', 'Themes', '/admin/ansuz_theme_installers', { :span_options => { :note => "Install themes from remote repositories."} })

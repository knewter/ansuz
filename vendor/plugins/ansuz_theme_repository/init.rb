# Include hook code here
require 'ansuz_theme'
Ansuz::PluginManagerInstance.register_admin_menu_entry('Themes', "Manage Repository", '/admin/ansuz_themes', { :span_options => { :note => "Administer this Ansuz installation's Theme Repository" } })

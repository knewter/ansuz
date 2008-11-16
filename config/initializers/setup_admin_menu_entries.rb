Ansuz::PluginManagerInstance.register_admin_menu_entry "Themes", 'Choose a Theme',  '/admin/site_settings/choose_theme', :span_options => { :note => "Easily change the look and feel of your site." }

Ansuz::PluginManagerInstance.register_admin_menu_entry "Content", 'Manage Pages',  '/admin/pages', :span_options => { :note => "This is where your site's primary content lives." }

Ansuz::PluginManagerInstance.register_admin_menu_entry "Ansuz", 'Manage Roles',  '/admin/roles'
Ansuz::PluginManagerInstance.register_admin_menu_entry "Ansuz", 'Site Settings', '/admin/site_settings', :span_options => { :note => "Change your site title, etc." }
Ansuz::PluginManagerInstance.register_admin_menu_entry "Ansuz", 'List Plugins',  '/admin/plugins'
Ansuz::PluginManagerInstance.register_admin_menu_entry "Ansuz", 'Logout', '/admin/account/logout'

Ansuz::PluginManagerInstance.register_page_type("Custom Page")

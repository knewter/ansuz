Ansuz::PluginManagerInstance.add_top_level_menu_entry "Themes"

Ansuz::PluginManagerInstance.register_admin_menu_entry "Themes", 'Choose a Theme',  '/admin/site_settings/choose_theme'

Ansuz::PluginManagerInstance.register_admin_menu_entry "Content", 'Manage Pages',  '/admin/pages'

Ansuz::PluginManagerInstance.register_admin_menu_entry "Ansuz", 'Site Settings', '/admin/site_settings'
Ansuz::PluginManagerInstance.register_admin_menu_entry "Ansuz", 'List Plugins',  '/admin/plugins'
Ansuz::PluginManagerInstance.register_admin_menu_entry "Ansuz", 'Logout', '/admin/account/logout'

Ansuz::PluginManagerInstance.register_page_type("Custom Page")

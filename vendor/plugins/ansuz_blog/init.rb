# Include hook code here
require 'blog_post'
require 'blog_comment'
Ansuz::PluginManagerInstance.register_plugin_nav('Blog', '/articles')
Ansuz::PluginManagerInstance.register_admin_menu_entry('Manage', 'Blog Entries', '/admin/blog_posts')
Ansuz::PluginManagerInstance.register_admin_menu_entry('Create', 'Blog Entry',  '/admin/blog_posts/new')

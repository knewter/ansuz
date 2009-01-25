# Include hook code here
Ansuz::PluginManagerInstance.register_plugin_nav('Blog', '/articles')
Ansuz::PluginManagerInstance.register_admin_menu_entry('Manage', 'Blog Entries', '/admin/blog_posts')
Ansuz::PluginManagerInstance.register_admin_menu_entry('Create', 'Blog Entry',  '/admin/blog_posts/new')

# Add a PagePlugin that will let you list recent posts
Ansuz::PluginManagerInstance.register_plugin(Ansuz::JAdams::Blog::RecentPostsWidget)

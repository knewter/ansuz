# Include hook code here
Ansuz::PluginManagerInstance.register_plugin_nav('Blog', '/articles')
Ansuz::PluginManagerInstance.register_admin_menu_entry('Manage', 'Blog Entries', '/admin/blog_posts')
Ansuz::PluginManagerInstance.register_admin_menu_entry('Create', 'Blog Entry',  '/admin/blog_posts/new')

# Add a PagePlugin that will let you list recent posts
Ansuz::PluginManagerInstance.register_plugin(Ansuz::JAdams::Blog::RecentPostsWidget)

# Add a box to the admin dashboard to see most recent comments
Ansuz::PluginManagerInstance.register_admin_dashboard_box("Recent Comments", 'articles/recent_comments_admin_dashboard_box')

# Add a statistic to the admin "At a Glance" box for Comments, Posts
Ansuz::PluginManagerInstance.register_at_a_glance_statistic "Blog Posts", :url => "/admin/blog_posts" do
  Ansuz::JAdams::BlogPost.count
end
Ansuz::PluginManagerInstance.register_at_a_glance_statistic "Blog Comments" do
  Comment.for("Ansuz::JAdams::BlogPost").count
end

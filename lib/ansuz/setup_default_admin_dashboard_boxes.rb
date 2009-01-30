# Add a box to the admin dashboard to see site stats at a glance
Ansuz::PluginManagerInstance.register_admin_dashboard_box("At a Glance", 'admin/default_dashboard_boxes/at_a_glance')

# Register an At-a-Glance entry for number of pages, page comments.
Ansuz::PluginManagerInstance.register_at_a_glance_statistic "Pages", :url => "/admin/pages" do
  Page.count
end
Ansuz::PluginManagerInstance.register_at_a_glance_statistic "Page Comments" do
  Comment.for("Page").count
end

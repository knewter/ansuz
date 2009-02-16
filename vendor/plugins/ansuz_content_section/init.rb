# FIXME: this unless statement needs to be removed, but without it you cant do rake gems:install, rake db:create:all or run the installer
unless !ActiveRecord::Base.configurations.blank?
  Ansuz::PluginManagerInstance.register_plugin(Ansuz::JAdams::ContentSection)
end  
  Ansuz::PluginManagerInstance.add_gem_dependency("RedCloth",  :lib => "redcloth")
  Ansuz::PluginManagerInstance.add_gem_dependency("BlueCloth", :lib => "bluecloth")
  Ansuz::PluginManagerInstance.register_page_type("Content Page", ["Ansuz::JAdams::ContentSection"])
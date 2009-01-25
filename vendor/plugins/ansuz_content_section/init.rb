Ansuz::PluginManagerInstance.register_plugin(Ansuz::JAdams::ContentSection)
Ansuz::PluginManagerInstance.add_gem_dependency("RedCloth",  :lib => "redcloth")
Ansuz::PluginManagerInstance.add_gem_dependency("BlueCloth", :lib => "bluecloth")
Ansuz::PluginManagerInstance.register_page_type("Content Page", ["Ansuz::JAdams::ContentSection"])

# Include hook code here
require 'content_section'
Ansuz::PluginManagerInstance.register_plugin(Ansuz::JAdams::ContentSection)
Ansuz::PluginManagerInstance.register_page_type("Content Page", ["Ansuz::JAdams::ContentSection"])

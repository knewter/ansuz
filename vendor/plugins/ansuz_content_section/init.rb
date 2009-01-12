Ansuz::PluginManagerInstance.register_plugin(Ansuz::JAdams::ContentSection)
Ansuz::PluginManagerInstance.register_page_type("Content Page", ["Ansuz::JAdams::ContentSection"])

# This is one way to define gem dependencies per plugin, instead of dumping them in config/environment.rb. rake gems:install should
# pick up on whatever we define in the init.rb files
Rails::Configuration.new do |config|
  config.gem "RedCloth",  :lib => "redcloth"
  config.gem "BlueCloth", :lib => "bluecloth"
end

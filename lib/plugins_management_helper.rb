module PluginsManagementHelper
  def list_plugins
    plugins_dir.entries.sort.delete_if{|e| e =~ /^\.$|^\.\.$/ }
  end

  def plugins_dir
    Dir.new(plugins_root)
  end

  def plugins_root
    "#{RAILS_ROOT}/ansuz_installed_plugins"
  end
end

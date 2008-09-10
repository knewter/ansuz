class Ansuz
  class PluginManager
    attr_accessor :plugins, :plugin_nav

    def initialize
      @plugins = []
      @plugin_nav = []
    end

    # A plugin can call register_plugin(ClassName) to add itself to the plugins array
    def register_plugin klass
      self.plugins << klass
    end

    # A plugin can call register_plugin_nav(title, link) to add itself to the
    # user-facing navigation menu
    def register_plugin_nav title, link
      self.plugin_nav << [title, link]
    end
  end
end

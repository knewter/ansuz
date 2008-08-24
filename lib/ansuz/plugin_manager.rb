class Ansuz
  class PluginManager
    attr_accessor :plugins

    def initialize
      @plugins = []
    end

    # A plugin can call register_plugin(ClassName) to add itself to the plugins array
    def register_plugin klass
      self.plugins << klass
    end
  end
end

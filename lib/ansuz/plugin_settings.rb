module Ansuz
  # Don't really know the best way to do this, just rolling with whatever works -james
  module PluginSettings
    class << self
      def included base
        base.extend ClassMethods
      end
    end

    module ClassMethods
      def plugin_settings
        SiteSetting.first.settings[self.settings_name]
      end

      def settings_name
        self.to_s.tableize.gsub(/\//,'_').to_sym
      end

      def modify_setting(name,val)
        site_setting = SiteSetting.first
        site_setting.settings[self.settings_name][name.to_sym] = val
        site_setting.save
      end
    end
  end
end

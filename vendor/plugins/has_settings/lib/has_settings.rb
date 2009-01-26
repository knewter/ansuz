module HasSettings
  VERSION = "0.1.0"

  class << self
    def included base #:nodoc:
      base.extend ClassMethods
    end
  end

  module ClassMethods
    # has_settings will allow you to access a serialized settings hash
    # on your ActiveRecord objects like so:
    #
    # class Widget < ActiveRecord::Base
    #   has_settings
    # end
    #
    # >> w = Widget.new
    # >> w.settings #=> {}
    # >> w.settings["foo"] = "bar"
    # >> w.save
    # >> w.reload
    # >> w.settings["foo"] #=> "bar
    def has_settings
      has_one :has_settings_setting, :as => "configurable"
      after_save :save_settings

      define_method "settings" do |*args|
        @the_has_settings_setting ||= get_has_settings_setting
        @the_has_settings_setting.settings || {}
      end

      define_method "settings=" do |the_settings|
        self.has_settings_setting.settings = the_settings
      end

      define_method "save_settings" do
        get_has_settings_setting.save
      end

      define_method "get_has_settings_setting" do
        if self.has_settings_setting
          self.has_settings_setting
        else
          self.has_settings_setting = HasSettingsSetting.new :settings => {}
          self.has_settings_setting
        end
      end
    end
  end
end

# Set it all up.
if Object.const_defined?("ActiveRecord")
  ActiveRecord::Base.send(:include, HasSettings)
end

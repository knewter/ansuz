require 'ansuz/j_adams/plugin_repository_manager'

module Ansuz
  module JAdams
    class AnsuzPlugin < ActiveRecord::Base
      validates_uniqueness_of :name

      before_save :clean_up_name
      after_save :update_plugin_repository_xml
      # FIXME: The plugin installer and repository plugins are intermingled and gross

      def update_plugin_repository_xml
        Ansuz::JAdams::PluginRepositoryManager.write_file
      end

      def clean_up_name
        self.name = self.name.gsub(/ /, '_')
      end
    end
  end
end

require 'ansuz/jadams/theme_repository_manager'

module Ansuz
  module JAdams
    class AnsuzTheme < ActiveRecord::Base
      validates_uniqueness_of :name

      after_save :update_theme_repository_xml
      # FIXME: The theme installer and repository plugins are intermingled and gross

      def update_theme_repository_xml
        Ansuz::JAdams::ThemeRepositoryManager.write_file
      end
    end
  end
end

class Ansuz
  class JAdams
    class ContentSection < ActiveRecord::Base
      #version_fu :table_name => 'content_section_versions'

      def edit_path
        "/content_sections/#{id}/edit"
      end

      def self.view_partial
        "/content_sections/content_section"
      end
    end
  end
end

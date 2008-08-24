class Ansuz
  class JAdams
    class ContentSection < ActiveRecord::Base
      def edit_path
        "/content_sections/#{id}/edit"
      end

      def self.view_partial
        "/content_sections/content_section"
      end
    end
  end
end

module Ansuz
  module JAdams
    class ContentSection < ActiveRecord::Base
      acts_as_versioned

      def self.admin_partial
        "/content_sections/edit"
      end

      def edit_path
        "/content_sections/#{id}/edit"
      end

      def self.view_partial
        "/content_sections/content_section"
      end
    end
  end
end

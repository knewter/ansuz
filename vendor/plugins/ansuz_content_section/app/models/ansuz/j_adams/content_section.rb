module Ansuz
  module JAdams
    class ContentSection < ActiveRecord::Base
      # Prevent bad things ™ from happening on initial rake db:migrate -james
      if( ActiveRecord::Base.connection.tables.include?("content_sections"))
        acts_as_versioned
      end

      def self.admin_partial
        "/admin/content_sections/edit"
      end

      def edit_path
        "/admin/content_sections/#{id}/edit"
      end

      def self.view_partial
        "/admin/content_sections/content_section"
      end
    end
  end
end

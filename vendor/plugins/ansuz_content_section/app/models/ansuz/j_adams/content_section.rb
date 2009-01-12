module Ansuz
  module JAdams
    class ContentSection < ActiveRecord::Base
      before_save :set_default_content_section_type

      CONTENT_SECTION_TYPES = ["FCKeditor", "Markdown", "Textile"]
      has_settings
      # Prevent bad things ™ from happening on initial rake db:migrate -james
      begin
        # It actually caused bad things when running rake db:create:all -josh
        if( ActiveRecord::Base.connection.tables.include?("content_sections"))
          acts_as_versioned
        end
      rescue
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

      def view_partial
        self.class.view_partial
      end

      def content_type=(val)
        self.settings[:content_section_type] = CONTENT_SECTION_TYPES.detect{|t| t == val.to_s }
      end

      def content_type
        self.settings[:content_section_type]
      end

      def markdown?
       self.content_type == "Markdown"
      end

      def fckeditor?
       self.content_type == "FCKeditor"
      end
      
      def textile?
       self.content_type == "Textile"
      end

      def to_html
        if( self.markdown? )
          return BlueCloth.new( self.contents ).to_html
        end

        if( self.textile? )
          return RedCloth.new( self.contents ).to_html
        end

        if ( self.fckeditor? )
          return self.contents
        end
      end

      protected
      def set_default_content_section_type
        if( self.content_type.nil? )
          self.content_type = "FCKeditor"
        end
      end
    end

  end
end

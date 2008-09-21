class Ansuz
  class JAdams
    class ScrollableContent < ActiveRecord::Base
      validates_presence_of   :name
      validates_uniqueness_of :name

      has_many :scrollable_content_sections, :class_name => "Ansuz::JAdams::ScrollableContentSection"

      def edit_path
        "/admin/scrollable_contents/#{id}"
      end

      def self.view_partial
        "/admin/scrollable_contents/scrollable_content"
      end
    end
  end
end

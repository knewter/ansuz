module Ansuz
  module JAdams
    class FlickrJs < ProtoPagePlugin
      has_settings

      def view_partial
        '/admin/flickr_js/flickr_js'
      end

      def self.admin_partial
        '/admin/flickr_js/edit'
      end
    end
  end
end

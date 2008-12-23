module Ansuz
  module JAdams
    class Twitterati < ProtoPagePlugin
      has_settings

      def view_partial
        '/admin/twitterati/twitterati'
      end

      def self.admin_partial
        '/admin/twitterati/edit'
      end
    end
  end
end

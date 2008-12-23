module Ansuz
  module JAdams
    class JskitRating < ProtoPagePlugin
      has_settings

      def view_partial
        case settings[:rating_type]
        when 'Scored'
          '/admin/jskit_ratings/jskit_rating_scored'
        else
          '/admin/jskit_ratings/jskit_rating'
        end
      end

      def self.admin_partial
        '/admin/jskit_ratings/edit'
      end
    end
  end
end

module Ansuz
  module JAdams
    class FeedReader < ActiveRecord::Base
      has_settings

      def edit_path
        "/admin/feed_readers/#{id}"
      end

      def self.admin_partial
        "/admin/feed_readers/feed_reader"
      end

      def self.view_partial
        "/feed_readers/feed_reader"
      end

      def view_partial
        self.class.view_partial
      end
    end
  end
end

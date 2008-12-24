module Ansuz
  module JAdams
    class GithubBadge < ProtoPagePlugin
      has_settings

      def view_partial
        '/admin/github_badges/github_badge'
      end

      def self.admin_partial
        '/admin/github_badges/edit'
      end
    end
  end
end

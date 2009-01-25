module Ansuz
  module JAdams
    module Blog
      class RecentPostsWidget < ProtoPagePlugin
        def view_partial
          '/articles/recent_posts'
        end
      end
    end
  end
end

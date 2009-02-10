module Ansuz
  module JAdams
    module UserExtensions
      def self.included(base)
        base.class_eval do
          has_many :blog_posts, :class_name => "Ansuz::JAdams::BlogPost", :foreign_key => :creator_id
        end
      end
    end
  end
end

require 'dispatcher'

# This should avoid the problem where methods go missing between reloads
Dispatcher.to_prepare {
  User.send :include, Ansuz::JAdams::UserExtensions
}

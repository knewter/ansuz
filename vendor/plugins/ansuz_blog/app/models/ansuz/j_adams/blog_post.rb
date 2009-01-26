module Ansuz
  module JAdams
    class BlogPost < ActiveRecord::Base
      acts_as_taggable
      acts_as_url :title
      stampable
      acts_as_commentable
      has_settings

      validates_uniqueness_of :url

      #belongs_to :author, :class_name => "User", :foreign_key => 'created_by'
      has_many :blog_comments, :class_name => "Ansuz::JAdams::BlogComment", :order => "created_at DESC"

      named_scope :recent, :limit => 5, :order => "created_at DESC" # FIXME: These should have publication dates, not just created_at

      def edit_path
        "/blog_posts/#{id}/edit"
      end

      def self.view_partial
        "/blog_posts/blog_post"
      end

      def to_s
        title
      end

      def to_param
        url
      end
    end
  end
end

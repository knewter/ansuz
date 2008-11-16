module Ansuz
  module JAdams
    class BlogComment < ActiveRecord::Base
      belongs_to :blog_post, :class_name => "Ansuz::JAdams::BlogPost"
    end
  end
end

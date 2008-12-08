module Ansuz
  module JAdams
    class ScrollableContentSection < ActiveRecord::Base
      belongs_to :scrollable_content, :class_name => "Ansuz::JAdams::ScrollableContent"
    end
  end
end

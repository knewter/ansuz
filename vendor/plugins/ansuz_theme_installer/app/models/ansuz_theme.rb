module Ansuz
  module JAdams
    class AnsuzTheme < ActiveRecord::Base
      validates_uniqueness_of :name
    end
  end
end

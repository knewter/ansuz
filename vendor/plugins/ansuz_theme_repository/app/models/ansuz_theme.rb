class Ansuz
  class JAdams
    class AnsuzTheme < ActiveRecord::Base
      validates_uniqueness_of :name

      def to_s
        name
      end
    end
  end
end

class Ansuz
  class JAdams
    class Testimonial < ActiveRecord::Base
      def self.random
        if count > 0
          find(:first, :offset => rand(count))
        end
      end
    end
  end
end

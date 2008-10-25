class Ansuz
  class JAdams
    class Testimonial < ActiveRecord::Base
      def self.random
        find(:first, :offset => rand(count))
      end
    end
  end
end

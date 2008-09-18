class Ansuz
  class JAdams
    class MenuEntry < ActiveRecord::Base
      acts_as_tree :order => 'position'
      def self.root_entries
        Ansuz::JAdams::MenuEntry.find(:all, :conditions => "parent_id IS NULL", :order => 'position')
      end
    end
  end
end

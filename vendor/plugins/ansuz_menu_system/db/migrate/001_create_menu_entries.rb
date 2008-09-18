class CreateMenuEntries < ActiveRecord::Migration
	def self.up
		create_table "menu_entries", :force => true do |t|
	    t.string  "name"
	    t.string  "link"
	    t.integer "position"
      t.integer "parent_id"
      t.timestamps
	  end
  end

  def self.end
    drop_table "menu_entries"
  end
end

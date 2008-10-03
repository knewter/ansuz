class CreateAnsuzThemes < ActiveRecord::Migration
	def self.up
		create_table "ansuz_themes", :force => true do |t|
	    t.string  "name"
	    t.string  "repository_url"
      t.timestamps
	  end
  end

  def self.end
    drop_table "ansuz_themes"
  end
end

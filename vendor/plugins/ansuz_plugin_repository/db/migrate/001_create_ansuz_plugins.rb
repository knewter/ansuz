class CreateAnsuzPlugins < ActiveRecord::Migration
	def self.up
		create_table "ansuz_plugins", :force => true do |t|
	    t.string  "name"
	    t.string  "repository_url"
      t.timestamps
	  end
  end

  def self.end
    drop_table "ansuz_plugins"
  end
end

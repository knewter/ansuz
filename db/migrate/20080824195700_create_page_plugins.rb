class CreatePagePlugins < ActiveRecord::Migration
  def self.up
    create_table :page_plugins do |t|
      t.integer :page_id
      t.string :module_type
      t.integer :module_id

      t.timestamps
    end
  end

  def self.down
    drop_table :page_plugins
  end
end

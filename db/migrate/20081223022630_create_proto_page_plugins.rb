class CreateProtoPagePlugins < ActiveRecord::Migration
  def self.up
    create_table :proto_page_plugins do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :proto_page_plugins
  end
end

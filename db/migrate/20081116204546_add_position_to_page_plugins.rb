class AddPositionToPagePlugins < ActiveRecord::Migration
  def self.up
    add_column :page_plugins, :position, :integer
  end

  def self.down
    remove_column :page_plugins, :position
  end
end

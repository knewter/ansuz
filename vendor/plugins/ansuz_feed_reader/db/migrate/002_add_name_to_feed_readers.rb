class AddNameToFeedReaders < ActiveRecord::Migration
  def self.up
    add_column :feed_readers, :name, :string
    add_index  :feed_readers, :name
  end

  def self.down
    remove_index :feed_readers, :column => :name
    remove_column :feed_readers, :name
  end
end

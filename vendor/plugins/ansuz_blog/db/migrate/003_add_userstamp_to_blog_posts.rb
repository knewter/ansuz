class AddUserstampToBlogPosts < ActiveRecord::Migration
  def self.up
    %w(creator updater deleter).each do |field|
      add_column :blog_posts, "#{field}_id", :integer
    end
  end

  def self.down
    %w(creator updater deleter).each do |field|
      remove_column :blog_posts, "#{field}_id"
    end
  end
end

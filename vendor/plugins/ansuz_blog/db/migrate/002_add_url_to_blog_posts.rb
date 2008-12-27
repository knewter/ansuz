class AddUrlToBlogPosts < ActiveRecord::Migration
  def self.up
    add_column :blog_posts, :url, :string
  end

  def self.down
    remove_column :blog_posts, :url
  end
end

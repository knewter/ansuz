class CreateBlogPosts < ActiveRecord::Migration
	def self.up
		create_table "blog_posts", :force => true do |t|
	    t.string  "title"
	    t.text    "contents"
      t.integer "created_by"
      t.timestamps
	  end

    create_table "blog_comments", :force => true do |t|
      t.string "author"
      t.string "email"
      t.string "website"
      t.text   "text"
      t.integer "blog_post_id"
      t.timestamps
    end
  end

  def self.end
    drop_table "blog_posts"
    drop_table "blog_comments"
  end
end

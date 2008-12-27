atom_feed do |feed|
  feed.title title_helper
  feed.updated @blog_posts.first.created_at

  for post in @blog_posts
    feed.entry(post, :url => article_path(post)) do |entry|
      entry.title post.title
      entry.content post.contents

      entry.author do |author|
        author.name post.author.login if post.author
      end
    end
  end
end

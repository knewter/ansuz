require_dependency 'blogger_api'

class BloggerService < XmlRpcService
  include SiteSettingsHelper
  web_service_api BloggerAPI
  before_invocation :authenticate

  def initialize(name)
  end

  def newPost(key, id, user, pw, content, publish)
    title, categories, body = content.match(%r{^<title>(.+?)</title>(?:<category>(.+?)</category>)?(.+)$}mi).captures rescue nil

    $stderr.puts "id=#{id} user=#{user} pw=#{pw}, content=#{content.inspect} [#{publish}]"
    blog_post = Ansuz::JAdams::BlogPost.new
    blog_post.contents = body || content || ''
    blog_post.title = title || content.split.slice(0..5).join(" ") || ""
    blog_post.user = User.find_by_login(user)
    blog_post.save
    blog_post.id
  end

  def editPost(key, post_id, user, pw, content, publish)
    $stderr.puts "id=#{post_id} user=#{user} pw=#{pw} content=#{content.inspect} [#{publish}]"
    true
  end

  def getUsersBlogs(key, user, pw)
    $stderr.puts "getting blogs for #{user}"
    blog = Blog::Blog.new(
      :url =>'http://blog',
      :blogid => 'myblog',
      :blogName => get_setting(:site_title)
    )
    [blog]
  end

  def getUserInfo(key, user, pw)
    $stderr.puts "getting user info for #{user}"
    Blog::User.new(:nickname => 'user', :email => 'user@test.com')
  end
end

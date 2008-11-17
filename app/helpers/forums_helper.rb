module ForumsHelper
  FORUM_CONTROLLERS = ["forums", "posts", "topics"]

  def handle_forum_header
    if FORUM_CONTROLLERS.include?(params[:controller])
      out = ""
      out << stylesheet_link_tag('forums')
      out << javascript_include_tag("lowpro", "application", :cache => 'beast', :plugin => 'ansuz_savage_beast')
      out << javascript_include_tag("prototype", "effects")
      unless @feed_icons.blank?
        @feed_icons.each do |feed|
          out << auto_discovery_link_tag(:rss, feed[:url], :title => "Subscribe to '#{feed[:title]}'")
        end
      end
      out
    end
  end
end

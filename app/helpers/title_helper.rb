module TitleHelper
  def display_site_title
    visit_link = link_to("Visit site", "/", :class => 'button2')
    if the_title = get_setting('site_title')
      content_tag "h1", the_title + visit_link, :class => 'title'
    end
  end

  def title_helper
    title_bits = []
    title_bits << get_setting('site_title')
    if @page
      title_bits << @page.title
    end
    title_bits.compact.reverse.join(" | ")
  end
end

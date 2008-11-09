module ToggleContentHelper
  def toggle_content_box link, &block
    link = link_to(link, "#", :class => 'toggle-link')
    concat("<div class='toggle-content-box'>#{link}<div class='toggle-contents'>", block.binding)
    yield
    concat("</div></div>", block.binding)
  end
end

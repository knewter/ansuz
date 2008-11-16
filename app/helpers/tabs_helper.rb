module TabsHelper
  def create_tab(tab_name, url, options={})
    span_options = options.delete(:span_options)
    if !current_page?(url)
      output = link_to(tab_name, url, options)
    else
      output = '<span>'
      output << tab_name
      output << '</span>'
    end
    if span_options && span_options[:note]
      output << '<span class="note">' + span_options[:note] + "</span>"
    end
    output
  end
end

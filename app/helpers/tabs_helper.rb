module TabsHelper
  def create_tab(tab_name, url, options={})
    span_options = options.delete(:span_options)
    if span_options && span_options[:note]
      tab_name << '<span class="note">' + span_options[:note] + "</span>"
    end
    if !current_page?(url)
      output = link_to(tab_name, url, options)
    else
      output = '<span>'
      output << tab_name
      output << '</span>'
    end
    output
  end
end

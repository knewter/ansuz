module FormsViewHelper
  def form_row the_label, the_field, options={}
    lbl = content_tag("th", the_label)
    if options[:note]
      the_field << content_tag("div", options[:note], :class => 'note')
    end
    fld = content_tag("td", the_field)
    content_tag("tr", lbl + fld)
  end

  def form_heading the_label, the_field
    hdr = content_tag("h3", the_label)
    content_tag("div", hdr + the_field, :class => "form-heading")
  end
end

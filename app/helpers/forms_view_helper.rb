module FormsViewHelper
  def form_row the_label, the_field, options={}
    label_options = options.delete(:label_options)
    field_options = options.delete(:field_options)
    lbl = content_tag("th", the_label, label_options)
    if options[:note]
      the_field << content_tag("div", options[:note], :class => 'note')
    end
    fld = content_tag("td", the_field, field_options)
    content_tag("tr", lbl + fld)
  end

  def form_heading the_label, the_field
    hdr = content_tag("h3", the_label)
    content_tag("div", hdr + the_field, :class => "form-heading")
  end
end

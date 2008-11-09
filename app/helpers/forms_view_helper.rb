module FormsViewHelper
  def form_row the_label, the_field
    lbl = content_tag("th", the_label)
    fld = content_tag("td", the_field)
    content_tag("tr", lbl + fld)
  end

  def form_heading the_label, the_field
    hdr = content_tag("h3", the_label)
    content_tag("div", hdr + the_field, :class => "form-heading")
  end
end

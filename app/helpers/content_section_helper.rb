module ContentSectionHelper
  def rollback_dropdown content_section, options={}
    options[:id] ||= "rollback_dropdown_for_content_section_" + content_section.id.to_s
    versions = versions_array(content_section)
    the_options = options_for_select(versions.reverse)
    the_id = content_section.id
    the_select = content_tag("select", the_options, :onchange => "redirect_to_rollback_link(#{the_id}, this.options[this.selectedIndex].value)")
    dropdown = content_tag("div", the_select, :id => options[:id])
    dropdown
  end

  def versions_array content_section
    content_section.versions.map do |version|
      ["Version ##{version.version} - " + version.created_at.to_s, version.version]
    end
  end
end

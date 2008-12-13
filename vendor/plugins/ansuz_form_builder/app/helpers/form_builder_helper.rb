module FormBuilderHelper
  def form_field_display_for form_field
    field_id = "form_field_#{form_field.id}"
    field_itself = case form_field.field_type
                   when "Ansuz::JAdams::FormFieldTextField"
                     text_field_tag(field_id)
                   when "Ansuz::JAdams::FormFieldTextArea"
                     if form_field.field.settings["has_rich_content_editor"]
                       fckeditor_textarea_tag("form_field_#{form_field.id}", nil, :toolbarSet => "Basic")
                     else
                       text_area_tag(field_id)
                     end
                   end
    form_row form_field.label, field_itself
  end

  def render_form_field_builder_view field, options={}
    partial_name = case field.field_type.to_s
                   when "Ansuz::JAdams::FormFieldTextField"
                     'form_field_text_field'
                   when "Ansuz::JAdams::FormFieldTextArea"
                     if field.settings["has_rich_content_editor"]
                       'form_field_rich_text_area'
                     else
                       'form_field_text_area'
                     end
                   else
                     'form_field_text_field'
                   end
    render :partial => "/admin/form_fields/builder_views/#{partial_name}",
      :locals => { :form_field => field }.merge(options[:locals] || {})
  end
end

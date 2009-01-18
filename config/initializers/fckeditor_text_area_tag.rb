module Fckeditor
  module Helper
    def fckeditor_textarea_tag(name, value='', options={})
      options[:id] ||= name
      cols = options[:cols].nil? ? '' : "cols='"+options[:cols]+"'"
      rows = options[:rows].nil? ? '' : "rows='"+options[:rows]+"'"
      
      width = options[:width].nil? ? '100%' : options[:width]
      height = options[:height].nil? ? '100%' : options[:height]
      
      toolbarSet = options[:toolbarSet].nil? ? 'Default' : options[:toolbarSet]
      
      if options[:ajax]
        inputs = "<input type='hidden' id='#{options[:id]}_hidden' name='#{name}'>\n" <<
                 "<textarea class='#{options[:className]}' id='#{options[:id]}' #{cols} #{rows} name='#{options[:id]}'>#{value}</textarea>\n"
      else 
        inputs = "<textarea class='#{options[:className]}' id='#{options[:id]}' #{cols} #{rows} name='#{name}'>#{value}</textarea>\n"
      end
      
      js_path = "#{ActionController::Base.relative_url_root}/javascripts"
      base_path = "#{js_path}/fckeditor/"
      return inputs <<
        javascript_tag("jQuery(document).ready(function(){ var oFCKeditor = new FCKeditor('#{options[:id]}', '#{width}', '#{height}', '#{toolbarSet}');\n" <<
                       "oFCKeditor.BasePath = \"#{base_path}\"\n" <<
                       "oFCKeditor.Config['CustomConfigurationsPath'] = '#{js_path}/fckcustom.js';\n" <<
                       "oFCKeditor.ReplaceTextarea(); });\n")
    end
  end
end

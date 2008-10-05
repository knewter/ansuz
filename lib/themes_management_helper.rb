module ThemesManagementHelper
  def list_themes
    themes_dir.entries.sort.delete_if{|e| e =~ /^\.$|^\.\.$/ }
  end

  def themes_dir
    Dir.new(themes_root)
  end

  def theme_preview_image_for theme
    "#{themes_root}/#{theme}/preview.png"
  end
  
  def themes_root
    "#{RAILS_ROOT}/themes"
  end
end

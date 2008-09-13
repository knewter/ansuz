module ThemesManagementHelper
  def list_themes
    themes_dir.entries.sort.delete_if{|e| e =~ /^\.$|^\.\.$/ }
  end

  def themes_dir
    Dir.new("#{RAILS_ROOT}/themes")
  end
end

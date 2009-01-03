module SiteSettingsHelper
  def get_setting(name)
    settings.send(name)
  end

  def get_theme_setting
    settings.get_theme_setting
  end

  protected
  def settings
    SiteSetting.find_or_create_by_name(:default)
  end
end

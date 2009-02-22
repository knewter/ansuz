# == Schema Information
# Schema version: 20090125222830
#
# Table name: site_settings
#
#  id                     :integer(4)      not null, primary key
#  name                   :string(255)
#  user_theme_name        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  site_title             :string(255)
#  show_inline_edit_links :boolean(1)
#  custom_css             :text
#

class SiteSetting < ActiveRecord::Base
  has_settings
  include CssSanitize

  def get_theme_setting
    theme_setting = self.send(:user_theme_name)
    theme_setting.blank? ? 'default' : theme_setting
  end
end

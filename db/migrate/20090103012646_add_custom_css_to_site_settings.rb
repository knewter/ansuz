class AddCustomCssToSiteSettings < ActiveRecord::Migration
  def self.up
    add_column :site_settings, :custom_css, :text
  end

  def self.down
    remove_column :site_settings, :custom_css
  end
end

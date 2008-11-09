class AddSiteTitleToSiteSettings < ActiveRecord::Migration
  def self.up
    add_column :site_settings, :site_title, :string
  end

  def self.down
    remove_column :site_settings, :site_title
  end
end

class AddShowInlineEditLinksToSiteSettings < ActiveRecord::Migration
  def self.up
    add_column :site_settings, :show_inline_edit_links, :boolean, :default => false
  end

  def self.down
    remove_column :site_settings, :show_inline_edit_links
  end
end

class CreateSiteSettings < ActiveRecord::Migration
  def self.up
    create_table :site_settings do |t|
      t.string :name
      t.string :user_theme_name

      t.timestamps
    end
  end

  def self.down
    drop_table :site_settings
  end
end

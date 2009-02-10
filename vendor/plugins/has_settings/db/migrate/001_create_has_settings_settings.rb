class CreateHasSettingsSettings < ActiveRecord::Migration
  def self.up
    create_table :has_settings_settings do |t|
      t.text    :settings
      t.integer :configurable_id
      t.string  :configurable_type
    end
  end

  def self.down
    drop_table :has_settings_settings
  end
end

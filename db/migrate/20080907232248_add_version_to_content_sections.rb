class AddVersionToContentSections < ActiveRecord::Migration
  def self.up
    create_table :content_section_versions do |t|
      t.integer :content_section_id, :version, :author_id
      t.string  :name
      t.text    :contents
      t.timestamps
    end
    add_column :content_sections, :version, :integer, :default => 1
  end

  def self.down
    remove_column :content_sections, :version
    drop_table :content_section_versions
  end
end

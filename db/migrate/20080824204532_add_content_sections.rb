class AddContentSections < ActiveRecord::Migration
  def self.up
    create_table :content_sections do |t|
      t.string :name
      t.text :contents

      t.timestamps
    end
  end

  def self.down
  end
end

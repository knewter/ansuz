class CreatePageMetadatas < ActiveRecord::Migration
  def self.up
    create_table :page_metadatas do |t|
      t.integer :page_id
      t.string :title
      t.string :subject
      t.text :description
      t.string :publisher
      t.string :rights

      t.timestamps
    end
  end

  def self.down
    drop_table :page_metadatas
  end
end

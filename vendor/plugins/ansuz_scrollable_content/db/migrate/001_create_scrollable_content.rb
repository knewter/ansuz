class CreateScrollableContent < ActiveRecord::Migration
  def self.up
    create_table "scrollable_contents", :force => true do |t|
      t.string :name
    end

    create_table "scrollable_content_sections", :force => true do |t|
      t.integer :scrollable_content_id
      t.string  :title
      t.text    :contents
    end
  end

  def self.down
    drop_table "scrollable_content_sections"

    drop_table "scrollable_contents"
  end
end

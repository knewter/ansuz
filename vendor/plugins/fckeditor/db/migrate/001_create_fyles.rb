class CreateFyles < ActiveRecord::Migration
  def self.up
    create_table "fyles", :force => true do |t|
      t.string  "mime_type"
      t.string    "file_name"

      t.timestamps
    end
  end

  def self.end
    drop_table "fyles"
  end
end

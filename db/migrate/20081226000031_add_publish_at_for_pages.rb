class AddPublishAtForPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :publish_at, :datetime

    add_index  :pages, :publish_at
    add_index  :pages, :published
  end

  def self.down
    remove_column :pages, :publish_at
  end
end

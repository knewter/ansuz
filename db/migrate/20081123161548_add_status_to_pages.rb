class AddStatusToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :status, :string
    add_index :pages, :status
  end

  def self.down
    remove_index :pages, :column => :status
    remove_column :pages, :status
  end
end

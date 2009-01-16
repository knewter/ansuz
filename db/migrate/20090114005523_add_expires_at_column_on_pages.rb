class AddExpiresAtColumnOnPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :expires_on, :datetime
  end

  def self.down
    remove_column :pages, :expires_on
  end
end

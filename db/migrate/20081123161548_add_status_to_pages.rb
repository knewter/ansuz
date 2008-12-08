class AddStatusToPages < ActiveRecord::Migration
  def self.up
    add_index :pages, :status
    # TODO: This needs to be moved to an 'initial setup' rake task
    Page.create(
      :name => 'home',
      :title => 'Home',
      :full_title => 'Home',
      :body => '',
      :page_order => 0,
      :created_at => 'NOW()',
      :updated_at => 'NOW()',
      :display_title => 0,
      :parent_id => nil,
      :linked => 1,
      :published => 1,
      :page_type => 'page'
    )
  end

  def self.down
    remove_index :pages, :column => :status
  end
end

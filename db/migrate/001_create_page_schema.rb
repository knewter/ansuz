class CreatePageSchema < ActiveRecord::Migration
  def self.up
    create_table "pages", :force => true do |t|
      t.string :name
      t.string :title
      t.string :full_title
      t.text   :body

      t.datetime :created_at
      t.datetime :updated_at

      t.integer  :page_order, :default => 0
      t.integer  :parent_id

      t.string   :page_type, :default => 'page'

      t.boolean  :display_title, :default => true
      t.boolean  :published, :default => true
      t.boolean  :linked, :default => true
      t.boolean  :show_sub_menu, :default => false
    end

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
    drop_table :pages
  end
end

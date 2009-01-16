# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090114005523) do

  create_table "content_section_versions", :force => true do |t|
    t.integer  "content_section_id"
    t.integer  "version"
    t.integer  "author_id"
    t.string   "name"
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_sections", :force => true do |t|
    t.string   "name"
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :default => 1
  end

  create_table "form_builder_responses", :force => true do |t|
    t.integer  "form_builder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_builders", :force => true do |t|
    t.string   "name"
    t.string   "submit_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "form_field_responses", :force => true do |t|
    t.integer "form_builder_response_id"
    t.integer "form_field_id"
    t.string  "string"
    t.boolean "boolean"
    t.text    "text"
  end

  create_table "form_field_text_areas", :force => true do |t|
    t.string "label"
  end

  create_table "form_field_text_fields", :force => true do |t|
    t.string "label"
  end

  create_table "form_fields", :force => true do |t|
    t.integer  "form_builder_id"
    t.integer  "position"
    t.string   "field_type"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "topics_count",     :default => 0
    t.integer "posts_count",      :default => 0
    t.integer "position"
    t.text    "description_html"
  end

  create_table "moderatorships", :force => true do |t|
    t.integer "forum_id"
    t.integer "user_id"
  end

  add_index "moderatorships", ["forum_id"], :name => "index_moderatorships_on_forum_id"

  create_table "monitorships", :force => true do |t|
    t.integer "topic_id"
    t.integer "user_id"
    t.boolean "active",   :default => true
  end

  create_table "page_metadatas", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "subject"
    t.text     "description"
    t.string   "publisher"
    t.string   "rights"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_plugins", :force => true do |t|
    t.integer  "page_id"
    t.string   "module_type"
    t.integer  "module_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "full_title"
    t.string   "status"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_order",    :default => 0
    t.integer  "parent_id"
    t.string   "page_type",     :default => "page"
    t.boolean  "display_title", :default => true
    t.boolean  "published",     :default => true
    t.boolean  "linked",        :default => true
    t.boolean  "show_sub_menu", :default => false
    t.datetime "publish_at"
    t.datetime "expires_on"
  end

  add_index "pages", ["publish_at"], :name => "index_pages_on_publish_at"
  add_index "pages", ["published"], :name => "index_pages_on_published"
  add_index "pages", ["status"], :name => "index_pages_on_status"

  create_table "photo_album_photos", :force => true do |t|
    t.integer "photo_album_id"
    t.string  "title"
    t.text    "caption"
    t.string  "photo_album_photo_image_file_name"
    t.string  "photo_album_photo_image_content_type"
    t.integer "photo_album_photo_image_file_size"
  end

  create_table "photo_albums", :force => true do |t|
    t.string "name"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_id"
    t.text     "body_html"
  end

  add_index "posts", ["forum_id", "created_at"], :name => "index_posts_on_forum_id"
  add_index "posts", ["topic_id", "created_at"], :name => "index_posts_on_topic_id"
  add_index "posts", ["user_id", "created_at"], :name => "index_posts_on_user_id"

  create_table "proto_page_plugins", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_settings", :force => true do |t|
    t.string   "name"
    t.string   "user_theme_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "site_title"
    t.boolean  "show_inline_edit_links", :default => false
    t.text     "custom_css"
  end

  create_table "taggings", :force => true do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string  "taggable_type"
    t.integer "user_id"
  end

  add_index "taggings", ["tag_id", "taggable_type"], :name => "index_taggings_on_tag_id_and_taggable_type"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"
  add_index "taggings", ["user_id", "tag_id", "taggable_type"], :name => "index_taggings_on_user_id_and_tag_id_and_taggable_type"
  add_index "taggings", ["user_id", "taggable_id", "taggable_type"], :name => "index_taggings_on_user_id_and_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0, :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"
  add_index "tags", ["taggings_count"], :name => "index_tags_on_taggings_count"

  create_table "topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hits",         :default => 0
    t.integer  "sticky",       :default => 0
    t.integer  "posts_count",  :default => 0
    t.datetime "replied_at"
    t.boolean  "locked",       :default => false
    t.integer  "replied_by"
    t.integer  "last_post_id"
  end

  add_index "topics", ["forum_id", "replied_at"], :name => "index_topics_on_forum_id_and_replied_at"
  add_index "topics", ["forum_id", "sticky", "replied_at"], :name => "index_topics_on_sticky_and_replied_at"
  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "posts_count",                             :default => 0
    t.datetime "last_seen_at"
    t.boolean  "admin",                                   :default => false
  end

end

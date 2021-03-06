# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121218114640) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "bio"
    t.string   "email"
    t.string   "skypename"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "admins_channels", :id => false, :force => true do |t|
    t.integer "channel_id"
    t.integer "admin_id"
  end

  create_table "appreciables", :force => true do |t|
    t.integer  "user_id"
    t.integer  "appreciable_id"
    t.string   "appreciable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "appreciated"
  end

  create_table "blogitems", :force => true do |t|
    t.text     "body"
    t.integer  "ownable_id"
    t.string   "item_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "youtubeembedlink"
    t.string   "ownable_type"
    t.integer  "position"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :default => 0
    t.boolean  "active",     :default => false
    t.integer  "parent_id"
    t.string   "model_name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "categorizations", :force => true do |t|
    t.integer "categorization_id"
    t.string  "categorization_type"
    t.integer "category_id"
  end

  add_index "categorizations", ["categorization_id", "categorization_type", "category_id"], :name => "index_categorizations"

  create_table "challenges", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "points"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "channel_id"
    t.boolean  "active",      :default => true
  end

  create_table "changemakers", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "fb_link"
    t.string   "tw_link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "channels", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "archived",    :default => false
    t.text     "links"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  create_table "contact_questions", :force => true do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "live"
    t.string   "livestream_embedcode"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "channel_id"
    t.datetime "airdate"
    t.text     "links"
  end

  create_table "ideas", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "channel_id"
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "image_relations", :force => true do |t|
    t.integer "image_id"
    t.integer "imageable_id"
    t.string  "imageable_type"
  end

  add_index "image_relations", ["image_id", "imageable_id", "imageable_type"], :name => "index_image_relations"

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.string   "name"
    t.string   "email"
    t.integer  "author_id"
    t.integer  "chattable_id"
    t.string   "chattable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "author_type"
  end

  create_table "pages", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "admin_id"
    t.integer  "user_id"
    t.integer  "channel_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "episode_id"
    t.boolean  "approved",   :default => false
    t.boolean  "hide",       :default => true
  end

  create_table "rewards", :force => true do |t|
    t.integer  "user_id"
    t.integer  "points"
    t.integer  "rewardable_id"
    t.string   "rewardable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "key"
    t.string   "description"
    t.string   "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "solutions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "challenge_id"
    t.integer  "channel_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "texts", :force => true do |t|
    t.string   "key"
    t.text     "description"
    t.string   "title"
    t.text     "body"
    t.boolean  "allow_title"
    t.boolean  "allow_body"
    t.integer  "position"
    t.boolean  "allow_images"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "key_title"
  end

  create_table "user_blogitems", :force => true do |t|
    t.text     "body"
    t.text     "youtubeembedlink"
    t.integer  "user_post_id"
    t.string   "item_type"
    t.datetime "published_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "user_posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "body"
    t.datetime "published_at"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                          :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.boolean  "active",                          :default => true
    t.string   "skypename"
    t.boolean  "show_skype"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "optin"
    t.string   "name"
    t.text     "bio"
    t.integer  "score",                           :default => 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["activation_token"], :name => "index_users_on_activation_token"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end

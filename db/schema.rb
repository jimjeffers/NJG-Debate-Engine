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

ActiveRecord::Schema.define(:version => 20090601205921) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "contents",    :limit => 144
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "excerpt"
    t.text     "content"
    t.boolean  "pro"
    t.string   "state"
    t.string   "guid"
    t.string   "revision_of"
    t.datetime "published_on"
    t.integer  "comment_count", :limit => 4
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 75
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["sport_id"], :name => "index_categories_on_sport_id"

  create_table "categorizations", :force => true do |t|
    t.integer  "category_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["article_id"], :name => "index_categorizations_on_article_id"
  add_index "categorizations", ["category_id"], :name => "index_categorizations_on_category_id"

  create_table "comments", :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.string   "author",     :limit => 125
    t.string   "url"
    t.string   "ip",         :limit => 40
    t.string   "email",      :limit => 75
    t.string   "state",      :limit => 50
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["article_id"], :name => "index_comments_on_article_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "debateables", :force => true do |t|
    t.integer  "user_id"
    t.integer  "debated_id"
    t.string   "debated_type", :limit => 32
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "debateables", ["debated_id", "debated_type"], :name => "index_debateables_on_debated_id_and_debated_type"
  add_index "debateables", ["user_id"], :name => "index_debateables_on_user_id"

  create_table "questions", :force => true do |t|
    t.integer  "sport_id"
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end

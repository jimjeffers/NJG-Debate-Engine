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

ActiveRecord::Schema.define(:version => 20090426182347) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rateable_id"
    t.string   "rateable_type", :default => "Answer"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130320181058) do

  create_table "black_cards", :force => true do |t|
    t.string   "text"
    t.integer  "blanks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "playa_id"
    t.integer  "black_card_id"
    t.integer  "wins"
    t.integer  "loses"
    t.integer  "draws"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "entries", ["black_card_id"], :name => "index_entries_on_black_card_id"
  add_index "entries", ["playa_id"], :name => "index_entries_on_playa_id"

  create_table "entries_white_cards", :force => true do |t|
    t.integer "entry_id"
    t.integer "white_card_id"
    t.integer "weight",         :default => 0
  end

  create_table "playas", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "white_cards", :force => true do |t|
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

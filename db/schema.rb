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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161124054155) do

  create_table "menu_items", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.text     "description"
    t.integer  "category"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "tags"
  end

  add_index "menu_items", ["restaurant_id"], name: "index_menu_items_on_restaurant_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "rating"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

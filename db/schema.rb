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

ActiveRecord::Schema.define(version: 20151012032106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.integer  "walk_id"
    t.integer  "walker_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pups", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "male_female"
    t.string   "pic"
    t.integer  "walks_completed", default: 0
    t.integer  "owner_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "age"
    t.integer  "weight"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.string   "headline"
    t.string   "phone"
    t.string   "emergency_phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
    t.text     "auth_hash"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

  create_table "visitor_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message_type"
    t.text     "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "walks", force: :cascade do |t|
    t.datetime "begin_time"
    t.integer  "duration"
    t.integer  "owner_id"
    t.integer  "walker_id"
    t.integer  "pup_id"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "started_by_owner",  default: false
    t.boolean  "started_by_walker", default: false
    t.boolean  "ended_by_owner",    default: false
    t.boolean  "ended_by_walker",   default: false
    t.string   "desk"
    t.string   "building"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.text     "message"
  end

end

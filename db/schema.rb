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

ActiveRecord::Schema.define(version: 20151016221036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "desk"
    t.string   "building"
    t.string   "full_street_address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "walk_id"
    t.integer  "walker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "number"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone_type"
  end

  create_table "pups", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "male_female"
    t.string   "pic"
    t.integer  "walks_completed", default: 0
    t.integer  "owner_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "age"
    t.integer  "weight"
    t.text     "additional_info"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.string   "headline"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "provider"
    t.string   "uid"
    t.text     "auth_hash"
    t.string   "linkedin_url"
    t.string   "location"
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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "started_by_walker", default: false
    t.boolean  "ended_by_walker",   default: false
    t.text     "message"
    t.integer  "location_id"
    t.integer  "phone_number_id"
  end

end

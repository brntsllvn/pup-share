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

ActiveRecord::Schema.define(version: 20151104040248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string   "desk"
    t.string   "building"
    t.string   "full_street_address"
    t.float    "latitude",            default: 34.6663093
    t.float    "longitude",           default: -120.1366846
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "locations", ["deleted_at"], name: "index_locations_on_deleted_at", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "walk_id"
    t.integer  "walker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean  "winner"
  end

  add_index "offers", ["deleted_at"], name: "index_offers_on_deleted_at", using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "number"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "phone_type"
    t.datetime "deleted_at"
  end

  add_index "phone_numbers", ["deleted_at"], name: "index_phone_numbers_on_deleted_at", using: :btree

  create_table "pups", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "male_female"
    t.string   "pic"
    t.integer  "owner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "age"
    t.integer  "size"
    t.text     "additional_info"
    t.string   "personality"
    t.datetime "deleted_at"
  end

  add_index "pups", ["deleted_at"], name: "index_pups_on_deleted_at", using: :btree

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
    t.datetime "deleted_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

  create_table "visitor_messages", force: :cascade do |t|
    t.string   "message_type"
    t.text     "message"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "walks", force: :cascade do |t|
    t.datetime "begin_time"
    t.integer  "duration"
    t.integer  "owner_id"
    t.integer  "pup_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "started_by_walker", default: false
    t.boolean  "ended_by_walker",   default: false
    t.text     "message"
    t.integer  "location_id"
    t.integer  "phone_number_id"
    t.datetime "deleted_at"
    t.integer  "winning_offer_id"
  end

  add_index "walks", ["deleted_at"], name: "index_walks_on_deleted_at", using: :btree

end

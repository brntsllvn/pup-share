class ResetSchema < ActiveRecord::Migration
  def change
    create_table "users", force: :cascade do |t|
      t.string   "first_name",             limit: 255
      t.string   "last_name",              limit: 255
      t.string   "address"
      t.date     "date_of_birth"
      t.string   "ssn_last_four"
      t.string   "phone"
      t.string   "emergency_phone"
      t.string   "email",                  limit: 255
      t.string   "password_digest",        limit: 255
      t.string   "publishable_key",        limit: 255
      t.string   "secret_key",             limit: 255
      t.string   "stripe_user_id",         limit: 255
      t.string   "stripe_account_type"
      t.text     "stripe_account_status",  default: "{}"
      t.string   "currency_symbol",        limit: 3
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
    end

    create_table "visitor_messages", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.string   "type"
      t.text     "message"
      t.datetime "created_at",   null: false
      t.datetime "updated_at",   null: false
    end

    create_table "walks", force: :cascade do |t|
      t.datetime "begin_time"
      t.string   "begin_location"
      t.integer  "duration"
      t.datetime "end_time"
      t.string   "end_location"
      t.integer  "owner_id"
      t.integer  "walker_id"      
      t.integer  "pup_id"
      t.datetime "created_at",       null: false
      t.datetime "updated_at",       null: false
    end

    create_table "pups", force: :cascade do |t|
      t.string   "name"
      t.string   "breed"
      t.string   "male_female"
      t.string   "vet_phone"
      t.string   "vet_name"
      t.text     "care_instructions"
      t.integer  "age"
      t.string   "insurance_provider"
      t.string   "pic"
      t.integer  "walks_completed",   default: 0
      t.integer  "owner_id"      
      t.datetime "created_at",        null: false
      t.datetime "updated_at",        null: false
    end

    create_table "offers", force: :cascade do |t|
      t.integer  "walk_id"
      t.integer  "walker_id"
      t.integer  "owner_id"
      t.string   "status"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end
  end
end

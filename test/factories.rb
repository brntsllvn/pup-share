FactoryGirl.define do

  factory :job do
    user_id 1
    drop_off_time DateTime.now
    drop_off_location 'Your desk in Ruby'
    pick_up_time DateTime.now + 1.hour
    pick_up_location 'My desk in Dawson'
    walker_id nil
    walk_request_pending_user_id nil
    
  end

  factory :user do
    id 1
    email 'brntsllvn@gmail.com'
    password 'lalalala'
    confirmed_at Time.now
  end
  
end

#   create_table "users", force: :cascade do |t|
#     t.string   "first_name"
#     t.string   "last_name"
#     t.string   "building"
#     t.string   "address"
#     t.string   "phone"
#     t.string   "emergency_phone"
#     t.boolean  "parent"
#     t.boolean  "walker"
#     t.datetime "created_at",                               null: false
#     t.datetime "updated_at",                               null: false
#     t.string   "email",                       default: "", null: false
#     t.string   "encrypted_password",          default: "", null: false
#     t.string   "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer  "sign_in_count",               default: 0,  null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.inet     "current_sign_in_ip"
#     t.inet     "last_sign_in_ip"
#     t.string   "confirmation_token"
#     t.datetime "confirmed_at"
#     t.datetime "confirmation_sent_at"
#     t.integer  "user_pending_requests_count", default: 0
#   end





#   create_table "jobs", force: :cascade do |t|
#     t.datetime "drop_off_time"
#     t.string   "drop_off_location"
#     t.datetime "pick_up_time"
#     t.string   "pick_up_location"
#     t.datetime "created_at",                   null: false
#     t.datetime "updated_at",                   null: false
#     t.integer  "user_id"
#     t.string   "pup_name"
#     t.string   "pup_breed"
#     t.string   "pup_weight"
#     t.string   "pup_gender"
#     t.string   "pup_vet_phone"
#     t.text     "pup_care_instructions"
#     t.integer  "pup_age"
#     t.integer  "walker_id"
#     t.integer  "walk_request_pending_user_id"
#   end
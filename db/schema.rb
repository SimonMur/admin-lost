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

ActiveRecord::Schema.define(version: 20171011114903) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "county_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["county_id"], name: "index_areas_on_county_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.string   "county_code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lostitems", force: :cascade do |t|
    t.integer  "type_id"
    t.string   "name"
    t.string   "id_number"
    t.string   "pp_number"
    t.string   "reg_number"
    t.string   "other_number"
    t.datetime "date_of_birth"
    t.integer  "county_id"
    t.string   "location"
    t.datetime "date_found"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["county_id"], name: "index_lostitems_on_county_id"
    t.index ["type_id"], name: "index_lostitems_on_type_id"
    t.index ["user_id"], name: "index_lostitems_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "identifier"
    t.string   "notice_type"
    t.boolean  "read"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.string   "cost"
    t.string   "duration"
    t.boolean  "support"
    t.boolean  "admin_panel"
    t.boolean  "lost_id_alerts"
    t.boolean  "reported_id_alerts"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "second_name"
    t.integer  "county_id"
    t.string   "idnumber"
    t.string   "mobilenumber"
    t.string   "question"
    t.datetime "dateofbirth"
    t.string   "picture"
    t.string   "last_name"
    t.integer  "area_id"
    t.boolean  "contract"
    t.boolean  "terms"
    t.boolean  "super_user"
    t.string   "user_code"
    t.integer  "plan_id"
    t.string   "notice_type"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["plan_id"], name: "index_users_on_plan_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end

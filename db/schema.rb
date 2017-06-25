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

ActiveRecord::Schema.define(version: 20170625131215) do

  create_table "admin_users", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",             limit: 50
    t.string   "last_name",              limit: 50
    t.string   "email",                  limit: 50
    t.string   "personal_email",         limit: 50
    t.string   "encrypted_password",     limit: 70, default: "",    null: false
    t.boolean  "enable",                            default: true
    t.boolean  "can_login",                         default: false
    t.string   "mobile",                 limit: 15, default: ""
    t.string   "mobile_other",           limit: 15, default: ""
    t.string   "reset_password_token",   limit: 10
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          limit: 1,  default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 20
    t.string   "last_sign_in_ip",        limit: 20
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "users", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",         limit: 100
    t.string   "last_name",          limit: 100
    t.integer  "gender",             limit: 1
    t.integer  "status",             limit: 1
    t.integer  "device_type",        limit: 1,   default: 0
    t.date     "date_of_birth"
    t.string   "facebook_id"
    t.string   "google_id"
    t.string   "email",              limit: 100, default: "", null: false
    t.string   "encrypted_password", limit: 70,  default: "", null: false
    t.integer  "sign_in_count",      limit: 1,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 20
    t.string   "last_sign_in_ip",    limit: 20
    t.string   "mobile",             limit: 15
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["first_name"], name: "index_users_on_first_name", using: :btree
    t.index ["last_name"], name: "index_users_on_last_name", using: :btree
    t.index ["status"], name: "index_users_on_status", using: :btree
  end

end

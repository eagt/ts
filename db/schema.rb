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

ActiveRecord::Schema.define(version: 20160224201843) do

  create_table "companies", force: :cascade do |t|
    t.string   "id_code",         limit: 25
    t.string   "company",         limit: 50,                  null: false
    t.string   "email",           limit: 255, default: "@",   null: false
    t.boolean  "head_quarter",                default: false
    t.boolean  "branch",                      default: false
    t.boolean  "pass_active",                 default: false
    t.boolean  "acc_active",                  default: false
    t.string   "password_digest", limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "companies", ["company"], name: "index_companies_on_company", using: :btree
  add_index "companies", ["email"], name: "index_companies_on_email", using: :btree
  add_index "companies", ["head_quarter"], name: "index_companies_on_head_quarter", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.string   "id_code",         limit: 25
    t.string   "first_name",      limit: 50,                  null: false
    t.string   "last_name",       limit: 50
    t.date     "dob"
    t.string   "email",           limit: 255, default: "@",   null: false
    t.string   "specialty",       limit: 25
    t.boolean  "pass_active",                 default: false
    t.boolean  "acc_active",                  default: false
    t.string   "password_digest", limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "professionals", ["dob"], name: "index_professionals_on_dob", using: :btree
  add_index "professionals", ["email"], name: "index_professionals_on_email", using: :btree
  add_index "professionals", ["id_code"], name: "index_professionals_on_id_code", using: :btree
  add_index "professionals", ["last_name"], name: "index_professionals_on_last_name", using: :btree
  add_index "professionals", ["specialty"], name: "index_professionals_on_specialty", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 20,                null: false
    t.string   "last_name",       limit: 20
    t.string   "email",           limit: 255, default: "@", null: false
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree

end

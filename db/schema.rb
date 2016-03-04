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

ActiveRecord::Schema.define(version: 20160303192451) do

  create_table "branches", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.integer  "professional_id", limit: 4
    t.string   "creator",         limit: 255
    t.string   "logged_as",       limit: 255
    t.string   "name",            limit: 50,                 null: false
    t.string   "id_code",         limit: 25
    t.string   "email",           limit: 255, default: "@",  null: false
    t.boolean  "branch",                      default: true
    t.datetime "last_in"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id", using: :btree
  add_index "branches", ["email"], name: "index_branches_on_email", using: :btree
  add_index "branches", ["id_code"], name: "index_branches_on_id_code", using: :btree
  add_index "branches", ["name"], name: "index_branches_on_name", using: :btree
  add_index "branches", ["professional_id"], name: "index_branches_on_professional_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.integer  "branch_id",       limit: 4
    t.integer  "professional_id", limit: 4
    t.string   "creator",         limit: 255
    t.string   "logged_as",       limit: 255
    t.string   "id_code",         limit: 25
    t.string   "name",            limit: 50,                null: false
    t.string   "last_name",       limit: 50,                null: false
    t.date     "dob"
    t.string   "email",           limit: 255, default: "@"
    t.string   "photo",           limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "clients", ["branch_id"], name: "index_clients_on_branch_id", using: :btree
  add_index "clients", ["company_id"], name: "index_clients_on_company_id", using: :btree
  add_index "clients", ["dob"], name: "index_clients_on_dob", using: :btree
  add_index "clients", ["email"], name: "index_clients_on_email", using: :btree
  add_index "clients", ["last_name"], name: "index_clients_on_last_name", using: :btree
  add_index "clients", ["professional_id"], name: "index_clients_on_professional_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.integer  "professional_id", limit: 4
    t.string   "id_code",         limit: 25
    t.string   "name",            limit: 50,                 null: false
    t.string   "email",           limit: 255, default: "@",  null: false
    t.string   "creator",         limit: 255
    t.string   "logged_as",       limit: 255
    t.string   "service",         limit: 25
    t.boolean  "head_quarter",                default: true
    t.string   "branch",          limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "companies", ["email"], name: "index_companies_on_email", using: :btree
  add_index "companies", ["head_quarter"], name: "index_companies_on_head_quarter", using: :btree
  add_index "companies", ["id_code"], name: "index_companies_on_id_code", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["professional_id"], name: "index_companies_on_professional_id", using: :btree

  create_table "contact_details", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.integer  "branch_id",       limit: 4
    t.integer  "professional_id", limit: 4
    t.integer  "client_id",       limit: 4
    t.integer  "user_id",         limit: 4
    t.string   "address_type",    limit: 255
    t.string   "address",         limit: 255
    t.string   "city",            limit: 255
    t.string   "state",           limit: 255
    t.string   "country",         limit: 255
    t.string   "tel",             limit: 255
    t.boolean  "validated",                   default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "contact_details", ["branch_id"], name: "index_contact_details_on_branch_id", using: :btree
  add_index "contact_details", ["city"], name: "index_contact_details_on_city", using: :btree
  add_index "contact_details", ["client_id"], name: "index_contact_details_on_client_id", using: :btree
  add_index "contact_details", ["company_id"], name: "index_contact_details_on_company_id", using: :btree
  add_index "contact_details", ["country"], name: "index_contact_details_on_country", using: :btree
  add_index "contact_details", ["professional_id"], name: "index_contact_details_on_professional_id", using: :btree
  add_index "contact_details", ["state"], name: "index_contact_details_on_state", using: :btree
  add_index "contact_details", ["user_id"], name: "index_contact_details_on_user_id", using: :btree

  create_table "payment_details", force: :cascade do |t|
    t.integer  "appointment_id",            limit: 4
    t.float    "total_project_price",       limit: 24
    t.float    "task_payment",              limit: 24
    t.float    "professional_fee",          limit: 24
    t.float    "remaining_project_payment", limit: 24
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "payment_details", ["appointment_id"], name: "index_payment_details_on_appointment_id", using: :btree
  add_index "payment_details", ["total_project_price"], name: "index_payment_details_on_total_project_price", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "creator",    limit: 255
    t.string   "logged_as",  limit: 255
    t.string   "id_code",    limit: 25
    t.string   "name",       limit: 50,                null: false
    t.string   "last_name",  limit: 50
    t.date     "dob",                                  null: false
    t.string   "email",      limit: 255, default: "@", null: false
    t.string   "service",    limit: 25
    t.string   "specialty",  limit: 25
    t.datetime "last_in"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "professionals", ["company_id"], name: "index_professionals_on_company_id", using: :btree
  add_index "professionals", ["dob"], name: "index_professionals_on_dob", using: :btree
  add_index "professionals", ["email"], name: "index_professionals_on_email", using: :btree
  add_index "professionals", ["id_code"], name: "index_professionals_on_id_code", using: :btree
  add_index "professionals", ["last_name"], name: "index_professionals_on_last_name", using: :btree
  add_index "professionals", ["service"], name: "index_professionals_on_service", using: :btree
  add_index "professionals", ["specialty"], name: "index_professionals_on_specialty", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 20,                  null: false
    t.string   "last_name",         limit: 20
    t.string   "email",             limit: 255, default: "@",   null: false
    t.string   "password_digest",   limit: 255
    t.string   "remember_digest",   limit: 255
    t.boolean  "admin"
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",                     default: false
    t.datetime "activated_at"
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree

end

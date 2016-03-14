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

ActiveRecord::Schema.define(version: 20160304163324) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "company_id",         limit: 4
    t.integer  "branch_id",          limit: 4
    t.integer  "client_id",          limit: 4
    t.string   "discipline",         limit: 25
    t.datetime "date_time",                        default: '2016-03-11 00:08:02', null: false
    t.string   "status",             limit: 255
    t.integer  "appointment_code",   limit: 4
    t.integer  "follow_up_code",     limit: 4
    t.string   "task_type",          limit: 50
    t.text     "task_note",          limit: 65535
    t.string   "photo",              limit: 255
    t.boolean  "needs_followup",                   default: false
    t.string   "payment_details_id", limit: 255
    t.string   "creator",            limit: 255
    t.string   "logged_as",          limit: 255
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  add_index "appointments", ["appointment_code"], name: "index_appointments_on_appointment_code", using: :btree
  add_index "appointments", ["branch_id"], name: "index_appointments_on_branch_id", using: :btree
  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["company_id"], name: "index_appointments_on_company_id", using: :btree
  add_index "appointments", ["date_time"], name: "index_appointments_on_date_time", using: :btree
  add_index "appointments", ["discipline"], name: "index_appointments_on_discipline", using: :btree
  add_index "appointments", ["status"], name: "index_appointments_on_status", using: :btree

  create_table "appointments_branches", force: :cascade do |t|
    t.integer "appointment_id", limit: 4
    t.integer "branch_id",      limit: 4
  end

  add_index "appointments_branches", ["appointment_id", "branch_id"], name: "index_appointments_branches_on_appointment_id_and_branch_id", using: :btree

  create_table "appointments_clients", force: :cascade do |t|
    t.integer "appointment_id", limit: 4
    t.integer "client_id",      limit: 4
  end

  add_index "appointments_clients", ["appointment_id", "client_id"], name: "index_appointments_clients_on_appointment_id_and_client_id", using: :btree

  create_table "branches", force: :cascade do |t|
    t.integer  "company_id",         limit: 4
    t.string   "discipline",         limit: 25
    t.string   "name",               limit: 50,                null: false
    t.string   "id_code",            limit: 25
    t.string   "email",              limit: 255, default: "@", null: false
    t.integer  "contact_details_id", limit: 4
    t.string   "creator",            limit: 255
    t.string   "logged_as",          limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id", using: :btree
  add_index "branches", ["discipline"], name: "index_branches_on_discipline", using: :btree
  add_index "branches", ["email"], name: "index_branches_on_email", using: :btree
  add_index "branches", ["id_code"], name: "index_branches_on_id_code", using: :btree
  add_index "branches", ["name"], name: "index_branches_on_name", using: :btree

  create_table "branches_clients", force: :cascade do |t|
    t.integer "branch_id", limit: 4
    t.integer "client_id", limit: 4
  end

  add_index "branches_clients", ["branch_id", "client_id"], name: "index_branches_clients_on_branch_id_and_client_id", using: :btree

  create_table "branches_professionals", force: :cascade do |t|
    t.integer "branch_id",       limit: 4
    t.integer "professional_id", limit: 4
  end

  add_index "branches_professionals", ["branch_id", "professional_id"], name: "index_branches_professionals_on_branch_id_and_professional_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "company_id",         limit: 4
    t.integer  "branch_id",          limit: 4
    t.string   "discipline",         limit: 25
    t.string   "id_code",            limit: 25
    t.string   "name",               limit: 50,                null: false
    t.string   "last_name",          limit: 50,                null: false
    t.date     "dob"
    t.string   "email",              limit: 255, default: "@"
    t.integer  "contact_details_id", limit: 4
    t.string   "photo",              limit: 255
    t.string   "creator",            limit: 255
    t.string   "logged_as",          limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "clients", ["branch_id"], name: "index_clients_on_branch_id", using: :btree
  add_index "clients", ["company_id"], name: "index_clients_on_company_id", using: :btree
  add_index "clients", ["discipline"], name: "index_clients_on_discipline", using: :btree
  add_index "clients", ["dob"], name: "index_clients_on_dob", using: :btree
  add_index "clients", ["email"], name: "index_clients_on_email", using: :btree
  add_index "clients", ["last_name"], name: "index_clients_on_last_name", using: :btree

  create_table "clients_companies", force: :cascade do |t|
    t.integer "client_id",  limit: 4
    t.integer "company_id", limit: 4
  end

  add_index "clients_companies", ["client_id", "company_id"], name: "index_clients_companies_on_client_id_and_company_id", using: :btree

  create_table "clients_professionals", id: false, force: :cascade do |t|
    t.integer "client_id",       limit: 4
    t.integer "professional_id", limit: 4
  end

  add_index "clients_professionals", ["client_id", "professional_id"], name: "index_clients_professionals_on_client_id_and_professional_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "id_code",            limit: 25
    t.string   "name",               limit: 50,                 null: false
    t.string   "email",              limit: 255, default: "@",  null: false
    t.integer  "contact_details_id", limit: 4
    t.string   "creator",            limit: 255
    t.string   "logged_as",          limit: 255
    t.string   "discipline",         limit: 25
    t.boolean  "head_quarter",                   default: true
    t.datetime "last_in"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "companies", ["discipline"], name: "index_companies_on_discipline", using: :btree
  add_index "companies", ["email"], name: "index_companies_on_email", using: :btree
  add_index "companies", ["id_code"], name: "index_companies_on_id_code", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

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
    t.string   "telephone",       limit: 255
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
  add_index "contact_details", ["telephone"], name: "index_contact_details_on_telephone", using: :btree
  add_index "contact_details", ["user_id"], name: "index_contact_details_on_user_id", using: :btree

  create_table "employments", force: :cascade do |t|
    t.integer  "company_id",          limit: 4
    t.integer  "professional_id",     limit: 4
    t.boolean  "validated",                     default: false
    t.datetime "absent_on"
    t.datetime "Holidays_from"
    t.datetime "Holidays_to"
    t.integer  "total_days_holidays", limit: 4
    t.integer  "total_days_off",      limit: 4
    t.integer  "creator",             limit: 4
    t.integer  "logged_as",           limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "employments", ["company_id", "professional_id"], name: "index_employments_on_company_id_and_professional_id", using: :btree
  add_index "employments", ["total_days_holidays"], name: "index_employments_on_total_days_holidays", using: :btree
  add_index "employments", ["total_days_off"], name: "index_employments_on_total_days_off", using: :btree

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

  create_table "prof_appointments", force: :cascade do |t|
    t.integer  "professional_id", limit: 4
    t.integer  "appointment_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "prof_appointments", ["professional_id", "appointment_id"], name: "index_prof_appointments_on_professional_id_and_appointment_id", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.string   "discipline",         limit: 25
    t.string   "creator",            limit: 255
    t.string   "logged_as",          limit: 255
    t.string   "id_code",            limit: 25
    t.string   "name",               limit: 50,                         null: false
    t.string   "last_name",          limit: 50
    t.date     "dob",                            default: '2016-03-10', null: false
    t.string   "email",              limit: 255, default: "@",          null: false
    t.string   "service",            limit: 25
    t.string   "specialty",          limit: 25
    t.integer  "contact_details_id", limit: 4
    t.string   "password_digest",    limit: 255
    t.string   "remember_digest",    limit: 255
    t.datetime "last_in"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "professionals", ["discipline"], name: "index_professionals_on_discipline", using: :btree
  add_index "professionals", ["dob"], name: "index_professionals_on_dob", using: :btree
  add_index "professionals", ["email"], name: "index_professionals_on_email", using: :btree
  add_index "professionals", ["id_code"], name: "index_professionals_on_id_code", using: :btree
  add_index "professionals", ["last_name"], name: "index_professionals_on_last_name", using: :btree
  add_index "professionals", ["service"], name: "index_professionals_on_service", using: :btree
  add_index "professionals", ["specialty"], name: "index_professionals_on_specialty", using: :btree

  create_table "updates_deletes", force: :cascade do |t|
    t.integer  "company_id",         limit: 4
    t.integer  "branch_id",          limit: 4
    t.integer  "professional_id",    limit: 4
    t.integer  "client_id",          limit: 4
    t.integer  "contact_details_id", limit: 4
    t.integer  "payment_details_id", limit: 4
    t.integer  "employment_id",      limit: 4
    t.integer  "appointments_id",    limit: 4
    t.string   "name",               limit: 255
    t.string   "last_name",          limit: 255
    t.string   "table_name",         limit: 255
    t.string   "column_name",        limit: 255
    t.string   "element",            limit: 255
    t.string   "action_taken",       limit: 255
    t.text     "reason",             limit: 65535
    t.string   "new_element",        limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "updates_deletes", ["action_taken"], name: "index_updates_deletes_on_action_taken", using: :btree
  add_index "updates_deletes", ["appointments_id"], name: "index_updates_deletes_on_appointments_id", using: :btree
  add_index "updates_deletes", ["branch_id"], name: "index_updates_deletes_on_branch_id", using: :btree
  add_index "updates_deletes", ["client_id"], name: "index_updates_deletes_on_client_id", using: :btree
  add_index "updates_deletes", ["company_id"], name: "index_updates_deletes_on_company_id", using: :btree
  add_index "updates_deletes", ["contact_details_id"], name: "index_updates_deletes_on_contact_details_id", using: :btree
  add_index "updates_deletes", ["employment_id"], name: "index_updates_deletes_on_employment_id", using: :btree
  add_index "updates_deletes", ["last_name"], name: "index_updates_deletes_on_last_name", using: :btree
  add_index "updates_deletes", ["new_element"], name: "index_updates_deletes_on_new_element", using: :btree
  add_index "updates_deletes", ["payment_details_id"], name: "index_updates_deletes_on_payment_details_id", using: :btree
  add_index "updates_deletes", ["professional_id"], name: "index_updates_deletes_on_professional_id", using: :btree
  add_index "updates_deletes", ["table_name"], name: "index_updates_deletes_on_table_name", using: :btree

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

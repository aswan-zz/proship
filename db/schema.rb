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

ActiveRecord::Schema.define(version: 20170316003354) do

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "iata_faa"
    t.string   "iaco"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "altitude"
    t.integer  "zone"
    t.string   "dst"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "airports", ["city"], name: "index_airports_on_city"
  add_index "airports", ["iata_faa"], name: "index_airports_on_iata_faa"
  add_index "airports", ["name"], name: "index_airports_on_name"

  create_table "availabilities", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.text     "comment"
    t.integer  "availability_type_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "member_id"
    t.integer  "creator_id"
  end

  add_index "availabilities", ["availability_type_id"], name: "index_availabilities_on_availability_type_id"

  create_table "availability_types", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "default_color"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "chairs", force: :cascade do |t|
    t.string   "name"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chairs", ["room_id"], name: "index_chairs_on_room_id"

  create_table "contract_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "gig_id"
    t.decimal  "salary"
    t.integer  "contract_status_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "contracts", ["contract_status_id"], name: "index_contracts_on_contract_status_id"
  add_index "contracts", ["gig_id"], name: "index_contracts_on_gig_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["name"], name: "index_countries_on_name"

  create_table "cruise_lines", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.integer  "chair_id"
    t.integer  "room_id"
    t.integer  "rank_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "job_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gigs", ["chair_id"], name: "index_gigs_on_chair_id"
  add_index "gigs", ["rank_id"], name: "index_gigs_on_rank_id"
  add_index "gigs", ["room_id"], name: "index_gigs_on_room_id"

  create_table "meeting_members", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "meeting_id"
    t.string   "role"
    t.string   "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meeting_members", ["meeting_id"], name: "index_meeting_members_on_meeting_id"
  add_index "meeting_members", ["member_id"], name: "index_meeting_members_on_member_id"

  create_table "meeting_types", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "default_color"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "meeting_type_id"
    t.datetime "scheduled"
    t.text     "note"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "meetings", ["meeting_type_id"], name: "index_meetings_on_meeting_type_id"

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pronounce"
    t.string   "email"
    t.date     "birthday"
    t.string   "address"
    t.string   "city"
    t.integer  "state_prov_id"
    t.integer  "country_id"
    t.string   "zip_post"
    t.string   "home_airport"
    t.string   "medical_conditions"
    t.string   "criminal_convictions"
    t.integer  "residency_id"
    t.integer  "citizenship_id"
    t.integer  "employee_number"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "main_phone",           limit: 30
    t.string   "main_mobile",          limit: 30
    t.string   "password"
    t.integer  "role_id"
    t.string   "fakepass"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "member_to_id"
    t.integer  "member_from_id"
    t.text     "note"
    t.integer  "parent"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "messages", ["member_from_id"], name: "index_messages_on_member_from_id"
  add_index "messages", ["member_to_id"], name: "index_messages_on_member_to_id"

  create_table "note_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "icon"
    t.string   "default_color"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "note_type_id"
    t.integer  "member_from_id"
    t.integer  "member_to_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "notes", ["member_from_id"], name: "index_notes_on_member_from_id"
  add_index "notes", ["member_to_id"], name: "index_notes_on_member_to_id"
  add_index "notes", ["note_type_id"], name: "index_notes_on_note_type_id"

  create_table "photos", force: :cascade do |t|
    t.string   "original_name"
    t.string   "file_name"
    t.boolean  "profile"
    t.text     "image_data"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminder_types", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "default_color"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "reminder_type_id"
    t.string   "note"
    t.datetime "schedule"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "reminders", ["member_id"], name: "index_reminders_on_member_id"
  add_index "reminders", ["reminder_type_id"], name: "index_reminders_on_reminder_type_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "permissions"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "ship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["ship_id"], name: "index_rooms_on_ship_id"

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.integer  "cruise_line_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "ships", ["cruise_line_id"], name: "index_ships_on_cruise_line_id"

  create_table "state_provs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "state_provs", ["name"], name: "index_state_provs_on_name"

end

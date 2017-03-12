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

ActiveRecord::Schema.define(version: 20170310165255) do

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pronounce"
    t.string   "email"
    t.date     "birthday"
    t.string   "address"
    t.string   "city"
    t.integer  "state_prov"
    t.integer  "country"
    t.string   "zip_post"
    t.string   "home_airport"
    t.string   "medical_conditions"
    t.string   "criminal_convictions"
    t.integer  "residency"
    t.integer  "citizenship"
    t.integer  "employee_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "note_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "state_provs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

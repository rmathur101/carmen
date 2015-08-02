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

ActiveRecord::Schema.define(version: 20150802232120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.string   "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "building_garages", force: :cascade do |t|
    t.integer  "building_id"
    t.integer  "garage_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "garage_id"
    t.integer  "section_id"
    t.integer  "status_id"
    t.string   "model"
    t.integer  "year"
    t.string   "color"
    t.string   "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "garages", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "phone_type_id"
    t.string   "number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "car_id"
    t.integer  "resident_id"
    t.integer  "valet_id"
    t.integer  "building_id"
    t.integer  "garage_id"
    t.integer  "section_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "resident_cars", force: :cascade do |t|
    t.integer  "car_id"
    t.integer  "resident_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "residents", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_days", force: :cascade do |t|
    t.integer  "schedule_id"
    t.integer  "day_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "car_id"
    t.time     "time"
    t.boolean  "is_active"
    t.boolean  "is_recurring"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "garage_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.integer  "building_id"
    t.string   "number"
    t.integer  "max_cars"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_phones", force: :cascade do |t|
    t.integer  "phone_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valet_garages", force: :cascade do |t|
    t.integer  "garage_id"
    t.integer  "valet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

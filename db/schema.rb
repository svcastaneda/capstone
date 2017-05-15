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

ActiveRecord::Schema.define(version: 20170515154359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_days", force: :cascade do |t|
    t.string "day_type", limit: 5, null: false
  end

  create_table "course_times", force: :cascade do |t|
    t.integer "time_type"
  end

  create_table "courses", force: :cascade do |t|
    t.string  "fall_availability",            limit: 10,              null: false
    t.string  "winter_availability",          limit: 10,              null: false
    t.string  "spring_availability",          limit: 10,              null: false
    t.string  "summer_1st_half_availability", limit: 10,              null: false
    t.string  "summer_2nd_half_availability", limit: 10,              null: false
    t.string  "summer_full_availability",     limit: 10,              null: false
    t.string  "phase",                        limit: 1,               null: false
    t.string  "prerequisites",                           default: [], null: false, array: true
    t.text    "description",                                          null: false
    t.integer "peoplesoft",                                           null: false
    t.integer "fall_times",                                           null: false
    t.integer "winter_times",                                         null: false
    t.integer "spring_times",                                         null: false
    t.integer "summer_1st_half_times",                                null: false
    t.integer "fall_days",                                            null: false
    t.integer "winter_days",                                          null: false
    t.integer "spring_days",                                          null: false
    t.integer "summer_1st_half_days",                                 null: false
    t.integer "summer_2nd_half_times",                                null: false
    t.integer "summer_full_times",                                    null: false
    t.integer "summer_2nd_half_days",                                 null: false
    t.integer "summer_full_days",                                     null: false
  end

  create_table "degree_reqs", force: :cascade do |t|
    t.integer "degree_id"
    t.integer "course_id"
    t.integer "class_type"
  end

  create_table "degrees", force: :cascade do |t|
    t.string  "name",                            null: false
    t.integer "num_intro",           default: 0, null: false
    t.integer "num_foundation",      default: 0, null: false
    t.integer "num_advanced",        default: 0, null: false
    t.integer "num_major_electives", default: 0, null: false
    t.integer "num_open_electives",  default: 0, null: false
  end

  create_table "params", force: :cascade do |t|
    t.integer "degree_id"
    t.integer "courses_per_quarter"
    t.integer "location"
  end

  create_table "plans", force: :cascade do |t|
    t.integer  "params_id"
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "major",            null: false
    t.string   "concentration",    null: false
    t.integer  "graduation_year",  null: false
    t.string   "phone_number",     null: false
    t.string   "bachelors_origin", null: false
    t.integer  "advisor_id",       null: false
    t.integer  "last_path"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "account_id",                 null: false
    t.string   "account_type",               null: false
    t.string   "username",        limit: 30, null: false
    t.string   "email",           limit: 30, null: false
    t.string   "password_digest",            null: false
    t.string   "fname",                      null: false
    t.string   "lname",                      null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end

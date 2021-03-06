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

ActiveRecord::Schema.define(version: 20140605142845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "assignments", ["group_id"], name: "index_assignments_on_group_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
  end

  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "password_hash"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.string   "password_salt"
    t.string   "email"
    t.string   "name"
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree

  create_table "submissions", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.string   "recording_file_name"
    t.string   "recording_content_type"
    t.integer  "recording_file_size"
    t.datetime "recording_updated_at"
    t.string   "name"
  end

  add_index "submissions", ["assignment_id"], name: "index_submissions_on_assignment_id", using: :btree
  add_index "submissions", ["student_id"], name: "index_submissions_on_student_id", using: :btree

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
  end

end

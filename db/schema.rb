# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema[7.1].define(version: 2026_07_16_065252) do
=======
ActiveRecord::Schema[7.1].define(version: 2026_07_16_000000) do
  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shift_exchange_requests", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "partner_id"
    t.integer "requester_shift_id"
    t.integer "partner_shift_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shift_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "requested_date"
    t.time "start_time"
    t.time "end_time"
    t.text "reason"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shift_requests_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "user_id"
    t.date "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login_id"
    t.integer "role"
=======
    t.integer "role", default: 2
  end

  add_foreign_key "shift_requests", "users"
end

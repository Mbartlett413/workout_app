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

ActiveRecord::Schema.define(version: 2020_10_02_171515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string "title"
    t.boolean "primary_exercise"
    t.boolean "accesory_exercise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "max_efforts", force: :cascade do |t|
    t.integer "max_amount"
    t.bigint "exercise_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_max_efforts_on_exercise_id"
    t.index ["user_id"], name: "index_max_efforts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "set_rep_combos", force: :cascade do |t|
    t.bigint "set_rep_id"
    t.integer "percent"
    t.integer "reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["set_rep_id"], name: "index_set_rep_combos_on_set_rep_id"
  end

  create_table "set_reps", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wasps", force: :cascade do |t|
    t.bigint "workout_id"
    t.integer "exercise_id"
    t.integer "set_rep_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_wasps_on_workout_id"
  end

  create_table "week_collections", force: :cascade do |t|
    t.bigint "week_id"
    t.integer "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_week_collections_on_week_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.string "title"
    t.boolean "active_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "max_efforts", "exercises"
  add_foreign_key "max_efforts", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "set_rep_combos", "set_reps"
  add_foreign_key "wasps", "workouts"
  add_foreign_key "week_collections", "weeks"
  add_foreign_key "workouts", "users"
end

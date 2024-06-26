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

ActiveRecord::Schema[7.1].define(version: 2024_06_26_144335) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.float "age"
    t.boolean "castrated"
    t.string "size"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_dogs_on_profile_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "street"
    t.integer "associated_chatroom"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["profile_id"], name: "index_messages_on_profile_id"
  end

  create_table "profile_groups", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_profile_groups_on_group_id"
    t.index ["profile_id"], name: "index_profile_groups_on_profile_id"
  end

  create_table "profile_walks", force: :cascade do |t|
    t.bigint "walk_id", null: false
    t.bigint "profile_id", null: false
    t.index ["profile_id"], name: "index_profile_walks_on_profile_id"
    t.index ["walk_id"], name: "index_profile_walks_on_walk_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "city"
    t.string "gender"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "walks", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.string "adress"
    t.bigint "group_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_walks_on_group_id"
    t.index ["profile_id"], name: "index_walks_on_profile_id"
  end

  add_foreign_key "dogs", "profiles"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "profiles"
  add_foreign_key "profile_groups", "groups"
  add_foreign_key "profile_groups", "profiles"
  add_foreign_key "profile_walks", "profiles"
  add_foreign_key "profile_walks", "walks"
  add_foreign_key "profiles", "users"
  add_foreign_key "walks", "groups"
  add_foreign_key "walks", "profiles"
end

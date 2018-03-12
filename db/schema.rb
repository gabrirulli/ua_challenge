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

ActiveRecord::Schema.define(version: 20180311191306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotel_managers", force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_hotel_managers_on_hotel_id"
    t.index ["user_id"], name: "index_hotel_managers_on_user_id"
  end

  create_table "hotel_translations", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["hotel_id"], name: "index_hotel_translations_on_hotel_id"
    t.index ["locale"], name: "index_hotel_translations_on_locale"
  end

  create_table "hotel_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_hotel_users_on_hotel_id"
    t.index ["user_id"], name: "index_hotel_users_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.text "description"
    t.decimal "average_price"
    t.integer "views_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
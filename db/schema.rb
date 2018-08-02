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

ActiveRecord::Schema.define(version: 2018_07_30_074802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additions", force: :cascade do |t|
    t.float "amount"
    t.integer "racking_id"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.integer "additive_id"
    t.integer "source_id"
  end

  create_table "additive_sources", force: :cascade do |t|
    t.integer "source_id"
    t.integer "additive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "additives", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batch_sources", force: :cascade do |t|
    t.integer "batch_id"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batches", force: :cascade do |t|
    t.string "code"
    t.integer "volume"
    t.string "name"
    t.string "notes"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.float "value"
    t.integer "racking_id"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rackings", force: :cascade do |t|
    t.integer "volume"
    t.integer "batch_id"
    t.integer "unit_id"
    t.integer "vessel_id"
    t.integer "state_id"
    t.datetime "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "closed_by_id"
    t.boolean "packaged", default: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "dimensions"
    t.float "factor"
    t.integer "base_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "vessel_types", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vessels", force: :cascade do |t|
    t.integer "vessel_type_id"
    t.string "code"
    t.integer "volume"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

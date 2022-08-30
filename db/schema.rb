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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_000123) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "y00ts", force: :cascade do |t|
    t.string "twitter_username"
    t.bigint "twitter_user_id"
    t.text "twitter_bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter_user_id"], name: "index_y00ts_on_twitter_user_id"
    t.index ["twitter_username"], name: "index_y00ts_on_twitter_username"
  end

  create_table "y00ts_categories", force: :cascade do |t|
    t.bigint "y00ts_id", null: false
    t.bigint "categories_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_y00ts_categories_on_categories_id"
    t.index ["y00ts_id"], name: "index_y00ts_categories_on_y00ts_id"
  end

  add_foreign_key "y00ts_categories", "categories", column: "categories_id"
  add_foreign_key "y00ts_categories", "y00ts", column: "y00ts_id"
end

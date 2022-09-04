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
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "y00t_categories", force: :cascade do |t|
    t.bigint "y00t_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_y00t_categories_on_category_id"
    t.index ["y00t_id"], name: "index_y00t_categories_on_y00t_id"
  end

  create_table "y00ts", force: :cascade do |t|
    t.string "twitter_username"
    t.string "twitter_user_id"
    t.text "twitter_description"
    t.string "twitter_profile_image_url"
    t.boolean "twitter_verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter_user_id"], name: "index_y00ts_on_twitter_user_id", unique: true
    t.index ["twitter_username"], name: "index_y00ts_on_twitter_username", unique: true
  end

  add_foreign_key "y00t_categories", "categories"
  add_foreign_key "y00t_categories", "y00ts"
end

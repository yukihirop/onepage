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

ActiveRecord::Schema.define(version: 20180221130422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_likes", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "from_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_likes_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "newest_revision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "kana"
    t.string "organization"
    t.text "introduction"
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "revisions", force: :cascade do |t|
    t.bigint "post_id"
    t.text "title"
    t.text "summary"
    t.text "goal"
    t.text "event_url"
    t.text "body"
    t.text "slide_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["post_id"], name: "index_revisions_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "post_likes", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "revisions", "posts"
end

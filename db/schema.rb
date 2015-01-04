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

ActiveRecord::Schema.define(version: 20150104133543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name",        limit: 510
    t.text     "description"
    t.string   "website",     limit: 510
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",        limit: 510
  end

  add_index "authors", ["slug"], name: "authors_slug_key", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 510
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",        limit: 510
  end

  add_index "categories", ["slug"], name: "categories_slug_key", unique: true, using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "title",             limit: 510
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "image1",            limit: 510
    t.string   "image2",            limit: 510
    t.string   "image3",            limit: 510
    t.string   "image4",            limit: 510
    t.string   "image5",            limit: 510
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.string   "short_description", limit: 510
    t.string   "thumbnail",         limit: 510
    t.string   "slug",              limit: 510
    t.boolean  "published",                     default: false, null: false
  end

  add_index "images", ["slug"], name: "images_slug_key", unique: true, using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 510
    t.text     "contenxt"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 510
  end

  add_index "news", ["slug"], name: "news_slug_key", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "published_at"
    t.string   "slug"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "posts", ["item_type", "item_id"], name: "index_posts_on_item_type_and_item_id", using: :btree

  create_table "sounds", force: :cascade do |t|
    t.string   "title",                  limit: 510
    t.integer  "user_id"
    t.integer  "category_id"
    t.text     "description"
    t.string   "soundfile",              limit: 510
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.string   "short_description",      limit: 510
    t.string   "thumbnail",              limit: 510
    t.string   "slug",                   limit: 510
    t.boolean  "published",                          default: false, null: false
    t.integer  "soundfile_file_size"
    t.string   "soundfile_content_type"
  end

  add_index "sounds", ["slug"], name: "sounds_slug_key", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id",                    null: false
    t.integer "taggable_id",               null: false
    t.string  "taggable_type", limit: 510, null: false
    t.integer "tagger_id"
    t.string  "tagger_type",   limit: 510
    t.string  "context",       limit: 256
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type"], name: "taggings_tag_id_taggable_id_taggable_type_key", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 510, null: false
  end

  add_index "tags", ["name"], name: "tags_name_key", unique: true, using: :btree

  create_table "textuals", force: :cascade do |t|
    t.string   "title",             limit: 510
    t.integer  "user_id"
    t.integer  "category_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.string   "short_description", limit: 510
    t.string   "thumbnail",         limit: 510
    t.string   "slug",              limit: 510
    t.boolean  "published",                     default: false, null: false
  end

  add_index "textuals", ["slug"], name: "textuals_slug_key", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",                limit: 510
    t.string   "email",                limit: 256, default: "", null: false
    t.string   "encrypted_password",   limit: 256, default: "", null: false
    t.string   "password_salt",        limit: 510, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",       limit: 510
    t.datetime "remember_created_at"
    t.string   "realname",             limit: 510
    t.string   "reset_password_token", limit: 510
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",   limit: 510
    t.string   "last_sign_in_ip",      limit: 510
    t.string   "confirmation_token",   limit: 510
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",             limit: 510
    t.integer  "author_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.text     "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_description", limit: 510
    t.string   "thumbnail",         limit: 510
    t.string   "slug",              limit: 510
    t.boolean  "published",                     default: false, null: false
  end

  add_index "videos", ["slug"], name: "videos_slug_key", unique: true, using: :btree

end

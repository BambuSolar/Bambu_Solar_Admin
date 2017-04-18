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

ActiveRecord::Schema.define(version: 20170418041101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "member_teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "picture_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "member_teams", ["picture_id"], name: "index_member_teams_on_picture_id", using: :btree

  create_table "opinions", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "signature"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ourworks", force: :cascade do |t|
    t.string   "title"
    t.integer  "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ourworks", ["picture_id"], name: "index_ourworks_on_picture_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_pictures", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_pictures", ["picture_id"], name: "index_product_pictures_on_picture_id", using: :btree
  add_index "product_pictures", ["product_id"], name: "index_product_pictures_on_product_id", using: :btree

  create_table "product_sub_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order"
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "picture_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "have_category", default: false
    t.boolean  "have_sub_type", default: false
    t.integer  "order"
  end

  add_index "product_types", ["picture_id"], name: "index_product_types_on_picture_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "description_detail"
    t.float    "price"
    t.boolean  "enabled"
    t.integer  "product_type_id"
    t.integer  "picture_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "url_video_youtube"
    t.string   "category",           default: "product"
    t.integer  "sub_type_id"
    t.integer  "order"
  end

  add_index "products", ["picture_id"], name: "index_products_on_picture_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "password_digest"
  end

  add_foreign_key "member_teams", "pictures"
  add_foreign_key "ourworks", "pictures"
  add_foreign_key "product_pictures", "pictures"
  add_foreign_key "product_pictures", "products"
  add_foreign_key "product_types", "pictures"
  add_foreign_key "products", "pictures"
end

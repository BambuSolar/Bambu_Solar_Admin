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

ActiveRecord::Schema.define(version: 20190302211531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "contact_infos", force: :cascade do |t|
    t.string   "telephones"
    t.string   "emails"
    t.string   "facebook_link"
    t.string   "mercadolibre_link"
    t.string   "address_text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "picture_id"
    t.string   "link_to_map"
  end

  create_table "general_information", force: :cascade do |t|
    t.string   "demonstrative_video"
    t.string   "catalog"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "home_website_configs", force: :cascade do |t|
    t.integer  "horizontal_picture_id"
    t.integer  "vertical_picture_id"
    t.text     "welcome_message"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "home_website_configs", ["horizontal_picture_id"], name: "index_home_website_configs_on_horizontal_picture_id", using: :btree
  add_index "home_website_configs", ["vertical_picture_id"], name: "index_home_website_configs_on_vertical_picture_id", using: :btree

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

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order"
  end

  add_index "product_categories", ["product_type_id"], name: "index_product_categories_on_product_type_id", using: :btree

  create_table "product_category_product_sub_types", force: :cascade do |t|
    t.integer  "product_sub_type_id"
    t.integer  "product_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "product_category_product_sub_types", ["product_category_id"], name: "index_product_category_product_sub_types_on_product_category_id", using: :btree
  add_index "product_category_product_sub_types", ["product_sub_type_id"], name: "index_product_category_product_sub_types_on_product_sub_type_id", using: :btree

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
    t.string   "denomination"
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "picture_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "have_classification", default: false
    t.boolean  "have_sub_type",       default: false
    t.integer  "order"
    t.boolean  "allow_category"
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
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "url_video_youtube"
    t.string   "classification",      default: "product"
    t.integer  "sub_type_id"
    t.boolean  "to_quote",            default: false
    t.string   "installation_manual"
  end

  add_index "products", ["picture_id"], name: "index_products_on_picture_id", using: :btree

  create_table "ribbons", force: :cascade do |t|
    t.string   "text"
    t.string   "link"
    t.integer  "picture_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ribbons", ["picture_id"], name: "index_ribbons_on_picture_id", using: :btree

  create_table "social_networks", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.string   "icon"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
  add_foreign_key "product_categories", "product_types"
  add_foreign_key "product_category_product_sub_types", "product_categories"
  add_foreign_key "product_category_product_sub_types", "product_sub_types"
  add_foreign_key "product_pictures", "pictures"
  add_foreign_key "product_pictures", "products"
  add_foreign_key "product_types", "pictures"
  add_foreign_key "products", "pictures"
  add_foreign_key "ribbons", "pictures"
end

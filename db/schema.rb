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

ActiveRecord::Schema.define(version: 20171130175241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "baskets", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_price"
    t.integer  "vat"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_id"], name: "index_baskets_on_order_id", using: :btree
    t.index ["product_id"], name: "index_baskets_on_product_id", using: :btree
  end

  create_table "buyers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_buyers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "order_date"
    t.date     "validation_date"
    t.string   "status"
    t.string   "address"
    t.integer  "buyer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.string   "material"
    t.string   "color"
    t.string   "size"
    t.integer  "weight"
    t.integer  "selling_price"
    t.integer  "retail_price"
    t.integer  "vat"
    t.integer  "seller_id"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "photo_1"
    t.string   "photo_2"
    t.string   "photo_3"
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["seller_id"], name: "index_products_on_seller_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.integer  "buyer_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_reviews_on_buyer_id", using: :btree
    t.index ["product_id"], name: "index_reviews_on_product_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "company_name"
    t.string   "address"
    t.text     "description"
    t.string   "website"
    t.integer  "delivery_time"
    t.integer  "delivery_fee"
    t.integer  "delivery_free_from"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_logo"
    t.index ["email"], name: "index_sellers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "baskets", "orders"
  add_foreign_key "baskets", "products"
  add_foreign_key "orders", "buyers"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "sellers"
  add_foreign_key "reviews", "buyers"
  add_foreign_key "reviews", "products"
end

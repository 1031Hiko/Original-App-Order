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

ActiveRecord::Schema.define(version: 20160305063958) do

  create_table "brands", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.text     "company_name",           limit: 65535
    t.text     "company_address",        limit: 65535
    t.string   "country",                limit: 255
    t.string   "user_name",              limit: 255
    t.string   "phone_number",           limit: 255
    t.string   "item_type",              limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "brands", ["email"], name: "index_brands_on_email", unique: true, using: :btree
  add_index "brands", ["reset_password_token"], name: "index_brands_on_reset_password_token", unique: true, using: :btree

  create_table "colors", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "order_date",               limit: 255
    t.string   "confirmation_expired_day", limit: 255
    t.string   "payment_term",             limit: 255
    t.string   "freight_company",          limit: 255
    t.string   "transport_type",           limit: 255
    t.string   "ship_type",                limit: 255
    t.string   "status",                   limit: 255
    t.integer  "brand_id",                 limit: 4
    t.integer  "retailer_id",              limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "style_number",       limit: 255
    t.integer  "price",              limit: 4
    t.string   "color",              limit: 255
    t.string   "size",               limit: 255
    t.string   "fabric",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id",           limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "products_colors", force: :cascade do |t|
    t.string   "product_id", limit: 255
    t.string   "color_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_sizes", force: :cascade do |t|
    t.string   "product_id", limit: 255
    t.string   "size_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retailers", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.text     "company_name",           limit: 65535
    t.text     "company_address",        limit: 65535
    t.string   "country",                limit: 255
    t.string   "user_name",              limit: 255
    t.string   "phone_number",           limit: 255
    t.string   "item_type",              limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "retailers", ["email"], name: "index_retailers_on_email", unique: true, using: :btree
  add_index "retailers", ["reset_password_token"], name: "index_retailers_on_reset_password_token", unique: true, using: :btree

  create_table "sizes", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "sold_products", force: :cascade do |t|
    t.string   "product_id",  limit: 255
    t.string   "color_id",    limit: 255
    t.string   "size_id",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_id", limit: 4
    t.integer  "price",       limit: 4
    t.integer  "quantity",    limit: 4
  end

end

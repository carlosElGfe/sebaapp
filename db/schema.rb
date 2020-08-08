# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_08_170644) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cookies", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "adress"
    t.string "ident"
    t.string "comuna"
  end

  create_table "flayers", force: :cascade do |t|
    t.integer "cooky_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cooky_id"], name: "index_flayers_on_cooky_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.boolean "finished"
    t.float "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "personal"
    t.boolean "almost"
    t.boolean "disp"
    t.boolean "copy"
    t.integer "ident"
    t.integer "total"
    t.string "content"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer "cookie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cookie_id"], name: "index_photos_on_cookie_id"
  end

  create_table "roads", force: :cascade do |t|
    t.integer "tree_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_roads_on_order_id"
    t.index ["tree_id"], name: "index_roads_on_tree_id"
  end

  create_table "trays", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "cookie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tree_id", null: false
    t.index ["cookie_id"], name: "index_trays_on_cookie_id"
    t.index ["order_id"], name: "index_trays_on_order_id"
    t.index ["tree_id"], name: "index_trays_on_tree_id"
  end

  create_table "trees", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "flayers", "cookies"
  add_foreign_key "orders", "customers"
  add_foreign_key "photos", "cookies", column: "cookie_id"
  add_foreign_key "roads", "orders"
  add_foreign_key "roads", "trees"
  add_foreign_key "trays", "cookies", column: "cookie_id"
  add_foreign_key "trays", "orders"
  add_foreign_key "trays", "trees"
end

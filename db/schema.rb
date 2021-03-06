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

ActiveRecord::Schema.define(version: 20160716172237) do

  create_table "category_for_products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_products", force: :cascade do |t|
    t.integer  "meal_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meal_products", ["meal_id"], name: "index_meal_products_on_meal_id"
  add_index "meal_products", ["product_id"], name: "index_meal_products_on_product_id"

  create_table "meals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "private"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id"

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_for_product_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "producer"
    t.float    "fat"
    t.float    "carbohydrate"
    t.float    "protein"
    t.float    "sugar"
    t.integer  "weight"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "calories"
    t.integer  "bar_code"
  end

  create_table "user_fat_persentage_developments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fat_persentage"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "user_weight_developments", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "weight"
    t.integer  "height"
    t.integer  "fat_percentage"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "username"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end

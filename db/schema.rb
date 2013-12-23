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

ActiveRecord::Schema.define(version: 20131222012145) do

  create_table "admin_articles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_clients", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_managers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "price"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "nif"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "country"
    t.string   "market"
    t.string   "payment_type"
    t.string   "payment_condition"
    t.integer  "discount"
    t.string   "currency"
    t.string   "password"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "locked",        default: false
    t.boolean  "active",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "client_id"
    t.string   "article_id"
    t.integer  "quantity"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "active",        default: false
    t.boolean  "locked",        default: false
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id"

end

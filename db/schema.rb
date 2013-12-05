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

ActiveRecord::Schema.define(version: 20131204170059) do

  create_table "articles", force: true do |t|
    t.string   "code"
    t.text     "description"
    t.integer  "tax"
    t.string   "family"
    t.integer  "pvp1"
    t.integer  "pvp2"
    t.integer  "pvp3"
    t.string   "storage"
    t.string   "type"
    t.boolean  "stock_change"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "nif"
    t.boolean  "active"
    t.boolean  "locked"
    t.text     "address"
    t.string   "phone"
    t.string   "fax"
    t.integer  "payment_condition"
    t.integer  "payment_type"
    t.integer  "market"
    t.string   "country"
    t.integer  "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "nif"
    t.boolean  "active"
    t.boolean  "locked"
    t.text     "address"
    t.string   "phone"
    t.string   "fax"
    t.integer  "payment_condition"
    t.integer  "payment_type"
    t.integer  "market"
    t.string   "country"
    t.integer  "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "company"
    t.string   "address"
    t.string   "phone"
    t.boolean  "active"
    t.boolean  "locked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

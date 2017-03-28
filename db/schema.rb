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

ActiveRecord::Schema.define(version: 20170328041152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "consumer_id"
    t.integer  "merchant_id"
    t.integer  "total"
    t.integer  "level"
    t.boolean  "redeemable"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "lat"
    t.integer  "lng"
  end

  create_table "consumers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "added_plaid"
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "reward_name"
    t.integer  "reward_threshold"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "lng"
    t.integer  "lat"
    t.boolean  "active_merchant"
    t.string   "google_place_id"
    t.string   "image"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "consumer_id"
    t.integer  "merchant_id"
    t.integer  "card_id"
    t.float    "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end

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

ActiveRecord::Schema.define(version: 2021_01_10_232021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "postcode"
    t.string "address"
    t.uuid "collection_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_group_id"], name: "index_addresses_on_collection_group_id"
  end

  create_table "bin_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "bin_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bin_types_collections", id: false, force: :cascade do |t|
    t.uuid "collection_id", null: false
    t.uuid "bin_type_id", null: false
  end

  create_table "collection_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "pickup_date", null: false
    t.uuid "collection_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_group_id"], name: "index_collections_on_collection_group_id"
  end

  add_foreign_key "addresses", "collection_groups"
  add_foreign_key "collections", "collection_groups"
end

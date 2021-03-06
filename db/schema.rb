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

ActiveRecord::Schema.define(version: 2019_05_27_003543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "antonyms", force: :cascade do |t|
    t.integer "definition_id"
    t.string "antonym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["definition_id"], name: "index_antonyms_on_definition_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "definitions", force: :cascade do |t|
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "definition"
    t.integer "source"
    t.string "hashed_def"
    t.string "lexical_category"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "collection_id"
    t.string "item_type"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_entries_on_collection_id"
    t.index ["item_type", "item_id"], name: "index_entries_on_item_type_and_item_id"
  end

  create_table "synonyms", force: :cascade do |t|
    t.integer "definition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "synonym"
    t.index ["definition_id"], name: "index_synonyms_on_definition_id"
  end

  add_foreign_key "entries", "collections"
end

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

ActiveRecord::Schema.define(version: 2019_03_28_011701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flaggings", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "flag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flag_id"], name: "index_flaggings_on_flag_id"
    t.index ["resource_id"], name: "index_flaggings_on_resource_id"
  end

  create_table "flags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outreach_workers", force: :cascade do |t|
    t.string "organization"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_outreach_workers_on_user_id"
  end

  create_table "re_entrants", force: :cascade do |t|
    t.string "neighborhood"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_re_entrants_on_user_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.datetime "startDate"
    t.datetime "endDate"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "image"
    t.string "desc"
    t.string "webpage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_taggings_on_resource_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "date"
    t.integer "outreach_worker_id"
    t.integer "re_entrant_id"
    t.integer "resource_id"
    t.boolean "resourceAccessed"
    t.datetime "dateAccessed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outreach_worker_id"], name: "index_transactions_on_outreach_worker_id"
    t.index ["re_entrant_id"], name: "index_transactions_on_re_entrant_id"
    t.index ["resource_id"], name: "index_transactions_on_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "address"
    t.string "image"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

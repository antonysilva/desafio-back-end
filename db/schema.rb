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

ActiveRecord::Schema.define(version: 2020_09_11_025131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "financial_transactions", force: :cascade do |t|
    t.bigint "transaction_type_id", null: false
    t.date "transaction_date", null: false
    t.time "transaction_time", null: false
    t.integer "amount", null: false
    t.integer "social_security", null: false
    t.string "card_number", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_financial_transactions_on_store_id"
    t.index ["transaction_type_id"], name: "index_financial_transactions_on_transaction_type_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.string "owner", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "owner"], name: "index_stores_on_name_and_owner", unique: true
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "signal", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "signal"], name: "index_transaction_types_on_name_and_signal", unique: true
  end

  add_foreign_key "financial_transactions", "stores"
  add_foreign_key "financial_transactions", "transaction_types"
end

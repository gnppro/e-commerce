# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_06_221732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

# Could not dump table "attributes" because of following StandardError
#   Unknown type 'options_order_by' for column 'options_order_by'

  create_table "options", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "slug", null: false
    t.string "description"
    t.integer "order"
    t.integer "count", default: 0
    t.uuid "attribute_id"
    t.index ["attribute_id"], name: "index_options_on_attribute_id"
  end

# Could not dump table "products" because of following StandardError
#   Unknown type 'product_kind' for column 'kind'

  add_foreign_key "options", "attributes"
end

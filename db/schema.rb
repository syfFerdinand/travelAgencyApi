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

ActiveRecord::Schema[7.0].define(version: 2022_05_20_102735) do
  create_table "automobiles", force: :cascade do |t|
    t.string "autoRef"
    t.string "autoBrand"
    t.string "autoModel"
    t.text "autoDescription"
    t.integer "autoAvailable"
    t.integer "autoDelete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "CityRef"
    t.string "CityName"
    t.text "CityDescriptif"
    t.date "CityDateCreated"
    t.integer "delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides", force: :cascade do |t|
    t.string "RefGuide"
    t.string "LastName"
    t.string "FirstName"
    t.integer "Age"
    t.string "sex"
    t.integer "available"
    t.integer "delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "SiteRef"
    t.string "SiteName"
    t.text "SiteDescription"
    t.date "SiteOpeningDate"
    t.integer "delete"
    t.integer "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_sites_on_city_id"
  end

  add_foreign_key "sites", "cities"
end

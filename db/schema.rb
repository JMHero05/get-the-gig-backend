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

ActiveRecord::Schema.define(version: 2020_10_20_234647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "image"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "auditions", force: :cascade do |t|
    t.bigint "actor_id", null: false
    t.bigint "role_id", null: false
    t.time "time"
    t.string "location"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "requested", default: true
    t.boolean "confirmed", default: false
    t.boolean "rejected", default: false
    t.index ["actor_id"], name: "index_auditions_on_actor_id"
    t.index ["role_id"], name: "index_auditions_on_role_id"
  end

  create_table "casting_directors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "agency"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.bigint "casting_director_id", null: false
    t.string "title"
    t.string "gig_type"
    t.boolean "union"
    t.string "producer"
    t.string "director"
    t.string "choreographer"
    t.string "music_director"
    t.date "opening_date"
    t.date "closing_date"
    t.string "gig_location"
    t.string "pay_rate"
    t.date "audition_date"
    t.string "audition_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["casting_director_id"], name: "index_gigs_on_casting_director_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "gig_id", null: false
    t.string "role_type"
    t.string "name"
    t.text "description"
    t.string "gender"
    t.integer "beg_age_range"
    t.integer "end_age_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gig_id"], name: "index_roles_on_gig_id"
  end

  add_foreign_key "auditions", "actors"
  add_foreign_key "auditions", "roles"
  add_foreign_key "gigs", "casting_directors"
  add_foreign_key "roles", "gigs"
end
